## 0.5.2

* [Add ActivePStore::Base.where.not(conditions) method](https://github.com/koic/active_pstore/commit/8d524575ab62be027ce22980a184f19dc82c842c)

## 0.5.1

* [ActivePStore::Base.where method accepts Array object.](https://github.com/koic/active_pstore/commit/b73df47313b44a69892b13b460e6b5b12dae42d7)
* [change interface, from ActivePStore::Base.find(id) to find(*ids).](https://github.com/koic/active_pstore/commit/8df26ab1de5732ca311bed10bda70a1b19bb7369)

## 0.5.0 Integration with Rails

* [Integration with Rails](https://github.com/koic/active_pstore/commit/f7ad2441b569b0faf63e2338834fa430151e57af)
* [add ModelGenerator](https://github.com/koic/active_pstore/commit/b47a55dfc1bd7c508b43fb7d0f69a9f011e07c98)
* [add ConfigGenerator](https://github.com/koic/active_pstore/commit/5b6a42c0d658809f21a5f6d10ff095dbb32576c9)

## 0.4.10

* [add ActivePStore::Base#[]= method](https://github.com/koic/active_pstore/commit/8c916c70133c651d2fee090ce5db67353907bbc1)
* [introduce for Rails Integraion, ActivePStore::Integration](https://github.com/koic/active_pstore/commit/fe078192a7d6f95dac98de158d55e373af6a69f8)
* [add ActivePStore::Base#find_or_initialize_by method](https://github.com/koic/active_pstore/commit/fdf94425997eab21a40c3a535dc61aa1f42c54fa)
* [add ActivePStore::Base#persisted? method.](https://github.com/koic/active_pstore/commit/f340a7e1fef040590726989110bed80acd0d5914)

## 0.4.9

* [ActivePStore::ConnectionHandling#connection_config](https://github.com/koic/active_pstore/commit/833367cdb60d787c176b1e2459f768677e49ea64)
* [add dependency Active Model](https://github.com/koic/active_pstore/commit/b0612194237305da9175effe380ae71c24b49f85)
* [add ActivePStore::Base.find_or_create_by method](https://github.com/koic/active_pstore/commit/bf3823b4b46a64b4c3d449a8277c59abd3f15e92)
* [add ActivePStore::Base#[] method](https://github.com/koic/active_pstore/commit/68b3b1388665817dbccf2a434bd234821e145bc2)

## 0.4.8

* [add ActivePStore::Base.save method](https://github.com/koic/active_pstore/commit/5dd14cbea1b06a813ab29a1a1eaa47c60896b99f)
* [ActivePStore::Base.new and build and create methods accept block assignments](https://github.com/koic/active_pstore/commit/af52d7ec8e29b14f7f42b41e3cb05ef65e081469)
* [ActivePStore::Base.create method accepts block assignments](https://github.com/koic/active_pstore/commit/032b5b6cd649f1e243ccd8686fd6868c5a2be554)
* [add ActivePStore::Base.first_or_create method](https://github.com/koic/active_pstore/commit/b7275773e0ef0e665307a48b498413a211b6062c)
* [ActivePStore::Base.create can create an Array of new objects](https://github.com/koic/active_pstore/commit/64e4160f9054e6028cfaae3534e7d755d9f686ab)

## 0.4.7

* [add ActivePStore::Base.new(attr1: val1, attr2: val2...) form.](https://github.com/koic/active_pstore/commit/6d0ee36b4cb6314e359d377980dcd985ba9174e0)
* [`alias build new` of ActivePStore::Base](https://github.com/koic/active_pstore/commit/29bceb58413a3d935e04b2ec26259f5b61043846)

## 0.4.6

* [ActivePStore::Collection#count accepts args](https://github.com/koic/active_pstore/commit/e93af5956e42299a04684d6eaec1d47cfbfcd498)
* [add like ActiveRecord::ModelSchema.table_name method](https://github.com/koic/active_pstore/commit/b3cf8b27cfb262d421f141852c79dd1854cd508a)

## 0.4.5

* [add minimum method](https://github.com/koic/active_pstore/tree/9cb90a041fad051415739c3791e65fe23064bd45)
* [add maximum method](https://github.com/koic/active_pstore/tree/1e532b416576b42247db48fa9c34155a8efb86ff)

## 0.4.4

* [add ActivePStore::Base.ids method](https://github.com/koic/active_pstore/commit/6fca3160351a0485455da9c18713cf26095c2078)
* [add ActivePStore::Collection#ids method](https://github.com/koic/active_pstore/commit/2becc3c96997388484e90c45f3acb5e91dbbfe0c)

## 0.4.3

* [add ActivePStore#update method](https://github.com/koic/active_pstore/commit/464f7f38e1c9d05d8fc5a6ce1e4cfce8fc0029f7)

## 0.4.2

* [add dynamic finder method](https://github.com/koic/active_pstore/commit/07b2dcb664022b283782cf12c9725e14e591489d)

## 0.4.1

* [identify ActivePStore::Collection object](https://github.com/koic/active_pstore/commit/0dc9b7e1a2054ecfaaf11f0cdbd9bae20251f6ee)

## 0.4.0

* rename this library (active-pstore -> active_pstore). change to recommended gem name.

## 0.3.1

Bug fix:

* [`ActivePStore::Base.find_by(conditions)`](https://github.com/koic/active_pstore/commit/8cf9d41c5434fe8f6f60e98b20e2e1ec07a05d6a)

## 0.3.0

introduce ActivePStore::Collection. (inspire by ActiveRecord::Relation)

describable codes:

* `ActivePStore::Base.where(conditions).update_all(updates)`
* `ActivePStore::Base.where(conditions).destroy_all`
* `ActivePStore::Base.where(conditions).count`
* `ActivePStore::Base.where(conditions).empty?`

## 0.2.0

* identify an object by ActivePStore::Base#id.
* add several finder methods.
