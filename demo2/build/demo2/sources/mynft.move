#[allow(lint(self_transfer))]
module demo2::mynft {
    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    // https://avatars.githubusercontent.com/u/19257955?v=4
    // John-jin
    struct MyNFT has key,store{
        id: UID,
        name: string::String,
        url: string::String
    }
//sui client call --function <function_name> --module <module_name> --package <package_id> --args <arguments> --gas-budget <gas_budget>
    public fun mint(name: string::String, url: string::String,ctx: &mut TxContext){
        let nft = MyNFT {
            id: object::new(ctx),
            name: name,
            url: url
        };
        transfer::transfer(nft, tx_context::sender(ctx));
    }

    public fun name(nft: &MyNFT): string::String {
        nft.name
    }

    public fun url(nft: &MyNFT): string::String {
        nft.url
    }
}
