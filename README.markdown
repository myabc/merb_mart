Merb eMart README
=================

Merb eMart is an *open-source e-commerce application*, developed on top of the 
recent Ruby-language Merb MVC framework. Although Merb eMart is designed for 
e-commerce sites of all sizes, the speed and scalability of the Merb framework 
make it scalable even for large online vendors.

In addition to Merb framework, the following technologies and frameworks
provide a foundation for Merb eMart:

 * **DataMapper** (bleeding-edge 0.9), for object relation mapping (ORM) and 
   persistence.
 * **RSpec**, for behavio(u)r driven development (BDD).
 * **ActiveMerchant**, for Credit Card, payment and shipping processing.
   as well as attachmerb\_fu, merb\_paginate.

See INSTALL or the project wiki for a full list of dependencies.

Merb eMart is inspired by other, Rails based e-commerce applications, including
[Substruct][substruct] and [Spree][spree]. Although Merb eMart started out as a
project to port Substruct to Merb, the initial 0.1 release of Merb eMart will
instead be a its own implementation of an e-commerce engine, trying to match
the feature sets other e-commerce applications, but taking advantages of the
unique features of Merb and DataMapper.

Developer Notes
---------------

**WARNING** : Merb eMart is at a very early development stages. At this stage, 
the application should be considered only for consumption by advanced Ruby and
Merb developers. If you're looking for something for production consumption,
or not yet ready to jump from Ruby on Rails, then we would strongly advise 
trying [Substruct][substruct] or [Spree][spree].

**REQUEST** : Your development support is very much appreciated. Please 
contact us below if you're interested in lending a hand with the development 
of this project. Or alternatively, clone the code, fork it, create some
patches and let us know when you're done.

Getting the Source
------------------

Performing a git clone on either of the following repositories will get you 
the latest source:

    git clone git://github.com/myabc/merb_mart.git
    git clone git://gitorious.org/merb_mart/mainline.git (on gitorious)

The following additional mirrors are available:

    git://repo.or.cz/merb_mart.git
    http://repo.or.cz/r/merb_mart.git

Installation and Setup
----------------------

Please see the INSTALL file for details on getting up and running with Merb eMart.

Copyright and License
---------------------

Merb eMart is licensed under the **GNU Public License (GPL)**:

   > Copyright (C) 2008  Alex Coles

   > This program is free software: you can redistribute it and/or modify
   > it under the terms of the GNU General Public License as published by
   > the Free Software Foundation, either version 2 of the License, or
   > (at your option) any later version.

   > This program is distributed in the hope that it will be useful,
   > but WITHOUT ANY WARRANTY; without even the implied warranty of
   > MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   > GNU General Public License for more details.

   > You should have received a copy of the GNU General Public License
   > along with this program.  If not, see <http://www.gnu.org/licenses/>.

A copy of the GPL License may be found in the GPL-LICENSE, included with
the distribution.

Support
-------

**WARNING REPEATED** : Merb eMart is still at a very early stage of its 
development. You should not use this code unless you're reasonably secure with 
the Ruby language, and the DataMapper and Merb frameworks. That said, _please 
do get involved_ - and if you're happy to contribute back with bug reports and 
patches, then we'll be happy to help you get the application up and running.

Your best source for support currently is either the wiki, IRC or the mailing
list:

 * **Merb eMart Wiki** (this is its temporary residence):
    http://github.com/myabc/merb_mart/wikis
 * **Merb eMart mailing list**:
    <http://groups.google.com/group/merb_mart>
 * **Merb eMart homepage**: _coming soon_
 * Contact the developers directly:
    - <alex@alexcolesportfolio.com> | myabc on #datamapper, #merb IRC

[substruct]:http://code.google.com/p/substruct/ "Substruct e-commerce project"
[spree]:http://spreehq.org/ "Spree Online Commerce for Ruby on Rails"
