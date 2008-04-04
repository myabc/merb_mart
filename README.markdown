MerbMart README
===============

MerbMart is an *open-source e-commerce engine*, developed on top of the recent
Ruby-language Merb MVC framework. Although MerbMart is designed for e-commerce
sites of all sizes, the speed and scalability of the Merb framework make it
scalable for even large online vendors.

In addition to Merb framework, MerbMart is also built on the following open-
source foundations:

 * DataMapper (0.9 branch), for object relation mapping (ORM) and persistence.
 * RSpec, for behavio(u)r driven development (BDD).
 * ActiveMerchant, for Credit Card, payment and shipping processing.
   as well as attachmerb\_fu, merb\_paginate.

See INSTALL or the project wiki for a full list of dependencies.

MerbMart is a loose port of the Substruct e-commerce application for Ruby-on-
Rails. The initial 0.1 release of MerbMart will be a feature-equivalent port
of Substruct 0.97. MerbMart borrows many ideas, its database entity-
relationship design and some lines of code from Substruct, and is grateful to i
ts developers for developing such a great application:
  http://code.google.com/p/substruct/
  http://substruct.subimage.com/

Developer ReadMe
----------------

**WARNING** : MerbMart is at a very early development stages. At this stage, 
the application should be considered only for consumption by advanced Ruby and
Merb developers. If you're looking for something for production consumption,
or not yet ready to jump from Ruby on Rails, then we would strongly advise 
trying Substruct.

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

Please see the INSTALL file for details on getting up and running with 
MerbMart.

Licensing and Copyright
-----------------------

MerbMart is released under the **Artistic License**. Copyright information,
as well as a copy of the Artistic License may be found in the LICENSE file.

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
  