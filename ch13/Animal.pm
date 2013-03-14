#弱引用
{
	package Animal;
	use Scalar::Util qw /weaken/;
	use Carp qw/croak/;
	use File::Temp qw /tempfile/;
	our %REGISTRY;
	sub named{
		my $class = shift;
		my $name = shift;
		my $self = {Name => $name,Color=>$class->default_color};
		my($fh ,$filename) = tempfile();
		$self->{temp_file} = $fh;
		$self->{temp_filename} = $filename;
		bless $self,$class;
		$REGISTRY{$self} = $self;
		weaken({$REGISTRY{$self}});
		$self;
	}
	sub registered{
		return map {'a '.ref($_)." named ".$_->name} values %REGISTRY;
	}
	sub DESTROY{
		my $self = shift;
		my $fh = $self->{temp_fh};
		unlink $self->{temp_filename};
		print '[',$self->name," has died.]\n";
	}
	sub name{
		my $either = shift;
		ref $either ? $either->{Name} : "an unnamed $either";
	}
	sub set_name{
		ref(my $self = shift) or croak "instance variable needed";
		$self->{Name} = shift;
	}
	sub speak{
		my $either = shift;
		print $either->name, " goes ",$either->sound,"\n";
	}
	sub eat{
		my $either = shift;
		my $food = shift;
		print $either->name," eats $food.\n";
	}
	sub default_color{'brown'}
	sub sound{croak "subclass must define a sound"}
	sub color{
		my $self = shift;
		ref $self ? $self->{Color} : $self->default_color;
	}
	sub set_color{
		ref(my $self = shift) or croak "instance variable needed";
		$self->{Color} = shift;
	}
}
{
	package Horse;
	our @ISA = qw /Animal/;
	sub sound{'neigh'}
	sub DESTROY{
		my $self = shift;
		$self->SUPER::DESTROY;
		print "[",$self->name," has gone off to the glue factory.]\n";
	}
}
{
	package Sheep;
	our @ISA = qw /Animal/;
	sub color{"white"}
	sub sound{'baaaah'}
}
1;
