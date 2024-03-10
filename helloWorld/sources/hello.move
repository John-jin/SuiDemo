// #[allow(lint(self_transfer))]
// module helloWorld::hello {
//     use std::string;
//     use sui::object::{Self, UID};
//     use sui::transfer;
//     use sui::package;
//     use sui::tx_context::{Self, TxContext};

//     struct Forge has key,store {
//         id: UID,
//         text: string::String
//     }

//     public fun mint(ctx: &mut TxContext){
//          let admin = Forge {
//             id: object::new(ctx),
//             text: string::utf8(b"Hello World!")
//         };
//         let publisher = package::claim(tx_context::sender(ctx), ctx);
//         transfer::public_transfer(publisher, tx_context::sender(ctx));
//         // public fun public_transfer<T: key + store>(obj: T, recipient: address)
//         // The type 'address' does not have the ability 'key'
//     }
// }

module helloWorld::my_module {

    // Part 1: Imports
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};



    struct Forge has key, store {
        id: UID,
        swords_created: u64,
    }

   
    fun init(ctx: &mut TxContext) {
        let admin = Forge {
            id: object::new(ctx),
            swords_created: 0,
        };

        transfer::transfer(admin, tx_context::sender(ctx));
    }



}