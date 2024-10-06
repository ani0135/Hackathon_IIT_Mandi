module 0xb09d9c5db731f10a78ed81d48c7541c48aad9fc3a45d3d4430d285accf86b9ff::OpticalFlowStorage {

    struct OpticalFlowData has key {
        data: vector<u8>,
    }

    public fun store_optical_flow(
        account: &signer,
        flow_data: vector<u8>
    ) {
        let data = OpticalFlowData { data: flow_data };
        move_to(account, data);
    }

    public fun get_optical_flow(account: address): vector<u8> acquires OpticalFlowData {
        let flow_data_ref = borrow_global<OpticalFlowData>(account);
        flow_data_ref.data
    }
}