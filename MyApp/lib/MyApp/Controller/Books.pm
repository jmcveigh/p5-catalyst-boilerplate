package MyApp::Controller::Books;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

MyApp::Controller::Books - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched MyApp::Controller::Books in Books.');
}

=head2 list

This subroutine renders a list of the books in MyApp.

=cut

sub booklist :Local {
    my ($self, $c) = @_;
    
    $c->stash(template => 'books/list.ttkt.html');
}

=head2 booklist_json

This subroutine outputs a list of the books in MyApp as JSON

=cut

use Data::Dumper;

sub booklist_json : Local {
    my($self, $c) = @_;
    $c->stash(data => [$c->model('DB::Book')->search({})->hashref_array]);
    $c->forward('View::JSON');
}

=encoding utf8

=head1 AUTHOR

A clever guy

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
