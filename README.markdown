MerbMart README
===============

MerbMart is an *open-source e-commerce engine*, developed on top of the recent
Ruby-language, Merb MVC framework. It takes advantage of the Merb's slices
plugin, allowing you to incorporate the engine into a customized e-commerce
solution.

Performance
-----------

_Mom and Pop?.. or Big Box?_

A key goal for the MerbMart engine is performance. Although MerbMart is
designed for e-commerce sites of all sizes, the speed and scalability of the
Merb and DataMapper frameworks make it scalable even for large online vendors.

The following technologies and frameworks provide a foundation for MerbMart:

 * **Merb**, for Model-View-Controller.
 * **DataMapper**, for object relation mapping (ORM) and persistence.
 * **ActiveMerchant**, for Credit Card, payment and shipping processing.
   as well as attachmerb\_fu, merb\_paginate.
 * **RSpec**, for behavio(u)r driven development (BDD).

See INSTALL or the project wiki for a full list of dependencies.

MerbMart is inspired by other, Rails based e-commerce applications, including
[Substruct][substruct] and [Spree][spree]. Although MerbMart started out as a
project to port Substruct to Merb, the initial 0.1 release of MerbMart will
instead be a its own implementation of an e-commerce engine, trying to match
the feature sets other e-commerce applications, but taking advantages of the
unique features of Merb and DataMapper.

About Slices
------------

Merb-Slices is a Merb plugin for using and creating application 'slices' which
help you modularize your application. Usually these are reuseable extractions
from your main app. In effect, a Slice is just like a regular Merb MVC
application, both in functionality as well as in structure.

When you generate a Slice stub structure, a module is setup to serve as a
namespace for your controller, models, helpers etc. This ensures maximum
encapsulation. You could say a Slice is a mixture between a Merb plugin (a
Gem) and a Merb application, reaping the benefits of both.

A host application can 'mount' a Slice inside the router, which means you have
full over control how it integrates. By default a Slice's routes are prefixed
by its name (a router :namespace), but you can easily provide your own prefix
or leave it out, mounting it at the root of your url-schema. You can even
mount a Slice multiple times and give extra parameters to customize an
instance's behaviour.

A Slice's Application controller uses controller\_for\_slice to setup slice
specific behaviour, which mainly affects cascaded view handling. Additionaly,
this method is available to any kind of controller, so it can be used for
Merb Mailer too for example.

There are many ways which let you customize a Slice's functionality and
appearance without ever touching the Gem-level code itself. It's not only easy
to add template/layout overrides, you can also add/modify controllers, models
and other runtime code from within the host application.

Installation and Setup
----------------------

Please see the INSTALL file for details on getting up and running with MerbMart.

Developer Notes
---------------

**WARNING** : MerbMart is at a very early development stages. At this stage,
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

Copyright and License
---------------------

MerbMart is licensed under the **GNU Public License (GPL)**:

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

**WARNING REPEATED** : MerbMart is still at a very early stage of its
development. You should not use this code unless you're reasonably secure with
the Ruby language, and the DataMapper and Merb frameworks. That said, _please
do get involved_ - and if you're happy to contribute back with bug reports and
patches, then we'll be happy to help you get the application up and running.

Your best source for support currently is either the wiki, IRC or the mailing
list:

 * **MerbMart Wiki** (this is its temporary residence):
    http://github.com/myabc/merb_mart/wikis
 * **MerbMart mailing list**:
    <http://groups.google.com/group/merb_mart>
 * **MerbMart homepage**: _coming soon_
 * Contact the developers directly:
    - <alex@alexcolesportfolio.com> | myabc on #datamapper, #merb IRC

[substruct]:http://code.google.com/p/substruct/ "Substruct e-commerce project"
[spree]:http://spreehq.org/ "Spree Online Commerce for Ruby on Rails"
