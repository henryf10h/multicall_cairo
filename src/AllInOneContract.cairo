%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.starknet.common.syscalls import get_caller_address, get_contract_address
from starkware.cairo.common.alloc import alloc
from src.IEx10b import Iex10b

// first we declare the interfaces
// then we declare the contract's functions: validate_various_exercises()
// we go exercise by exercise

//      ###INTERFACES###

@contract_interface
namespace IEx01 {
    func claim_points(){
    }

}

@contract_interface
namespace IEx02 {
    func my_secret_value() -> (my_secret_value: felt){
    }

    func claim_points(my_value: felt){
    }

}

@contract_interface
namespace IEx03 {
    func user_counters(account: felt) -> (user_counter: felt){
    }

    func increment_counter(){
    }

    func decrement_counter(){
    }

    func claim_points(){
    }

}

@contract_interface
namespace IEx04 {
    func user_slots(account: felt) -> (user_slot: felt){
    }

    func values_mapped(slot: felt) -> (value: felt) {
    }

    func assign_user_slot() {
    }

    func claim_points(expected_value: felt) {
    } 

}

@contract_interface
namespace IEx05 {
    func user_slots(account: felt) -> (user_slot: felt) {
    }

    func user_values(account: felt) -> (user_value: felt) {
    }

    func assign_user_slot() {
    }

    func copy_secret_value_to_readable_mapping() {
    }

    func claim_points(expected_value: felt) {
    } 

}

@contract_interface
namespace IEx06 {
    func user_slots(account: felt) -> (user_slot: felt) {
    }

    func user_values(account: felt) -> (user_value: felt) {
    }

    func assign_user_slot() {
    }

    func external_handler_for_internal_function(a_value: felt) {
    } 

    func claim_points(expected_value: felt) {
    } 

}

@contract_interface
namespace IEx07 {
    func claim_points(value_a: felt, value_b: felt){
    } 

}

@contract_interface
namespace IEx08 {
    func user_values(account: felt, slot: felt) -> (value: felt){
    }

    func set_user_values(account: felt, array_len: felt, array: felt*){
    }

    func claim_points(){
    } 

}

@contract_interface
namespace IEx09 {
    func get_sum(array_len: felt, array: felt*) -> (array_sum: felt) {
    }

    func claim_points(array_len: felt, array: felt*) {
    } 

}

@contract_interface
namespace IEx10 {
    func ex10b_address() -> (ex10b_address: felt){
    }

    func set_ex_10b_address(ex10b_address: felt){
    }

    func claim_points(secret_value_i_guess : felt, next_secret_value_i_chose : felt) {
    } 

}

@contract_interface
namespace IEx14 {
    func claim_points() {
    } 

}

@external
func validate_various_exercises{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() {
    let (currentContractAddress) = get_contract_address();
    
    // 1
    let exercise_1_contract_address = 1591509280391971671979263777446171019412522583809867665188727628997529900662;
    IEx01.claim_points(contract_address=exercise_1_contract_address);

    // 2
    let exercise_2_contract_address = 1067517588230639979884133346766193897095551944895293625855280238365728443292;
    let (ex02_secret_value) = IEx02.my_secret_value(contract_address=exercise_2_contract_address);
    IEx02.claim_points(contract_address=exercise_2_contract_address, my_value=ex02_secret_value);

    // 3
    let exercise_3_contract_address = 1086432947465216110691557072517050993057749394602776175826262695484039541684;
    IEx03.increment_counter(contract_address=exercise_3_contract_address); 
    IEx03.increment_counter(contract_address=exercise_3_contract_address);
    IEx03.increment_counter(contract_address=exercise_3_contract_address);
    IEx03.increment_counter(contract_address=exercise_3_contract_address);
    IEx03.decrement_counter(contract_address=exercise_3_contract_address) ; 
    IEx03.claim_points(contract_address=exercise_3_contract_address);

    // 4
    let exercise_4_contract_address = 3387262466780441900417273633747175144517715037121646293535032175584868800957;
    IEx04.assign_user_slot(contract_address=exercise_4_contract_address);
    let (user_slot) = IEx04.user_slots(contract_address=exercise_4_contract_address, account=currentContractAddress);
    let (value) = IEx04.values_mapped(contract_address=exercise_4_contract_address, slot=user_slot);
    IEx04.claim_points(contract_address=exercise_4_contract_address, expected_value=value - 32);

    // 5
    let exercise_5_contract_address = 1762046160852852348940801088815614098417952288856208564245207920905000448998;
    IEx05.assign_user_slot(contract_address=exercise_5_contract_address);
    IEx05.copy_secret_value_to_readable_mapping(contract_address=exercise_5_contract_address);
    let (user_value) = IEx05.user_values(contract_address=exercise_5_contract_address, account=currentContractAddress);
    IEx05.claim_points(contract_address=exercise_5_contract_address, expected_value=user_value);

    // 6
    let exercise_6_contract_address = 20060496102257455600952910040875378345224184951565231801940795314124484036;
    IEx06.assign_user_slot(contract_address=exercise_6_contract_address);
    IEx06.external_handler_for_internal_function(contract_address=exercise_6_contract_address, a_value=0);
    let (user_value) = IEx06.user_values(contract_address=exercise_6_contract_address, account=currentContractAddress);
    IEx06.claim_points(contract_address=exercise_6_contract_address, expected_value=user_value);

    // 7
    let exercise_7_contract_address = 230389261848598402870989060543424359496095982338256312561780370558236733440;
    IEx07.claim_points(contract_address=exercise_7_contract_address, value_a=50, value_b=0);

    // 8
    let exercise_8_contract_address = 1248172035032622887861381778063216478160411922890533069353323963749694576431;
    let (numbers_array : felt*) = alloc();
    assert [numbers_array] = 10;
    assert [numbers_array + 1] = 10;
    assert [numbers_array + 2] = 10;
    assert [numbers_array + 3] = 10;
    assert [numbers_array + 4] = 10;
    assert [numbers_array + 5] = 10;
    assert [numbers_array + 6] = 10;
    assert [numbers_array + 7] = 10;
    assert [numbers_array + 8] = 10;
    assert [numbers_array + 9] = 10;
    assert [numbers_array + 10] = 10;

    IEx08.set_user_values(
        contract_address=exercise_8_contract_address,
        account=currentContractAddress,
        array_len=11,
        array=numbers_array,
    );
    IEx08.claim_points(contract_address=exercise_8_contract_address);

    //9

    let exercise_9_contract_address = 357440137401702541001161216925035617424867493600456948346632631645015912369;
    let (numbers_array : felt*) = alloc();
    assert [numbers_array] = 220;
    assert [numbers_array + 1] = 73;
    assert [numbers_array + 2] = 25;
    assert [numbers_array + 3] = 10;
    assert [numbers_array + 4] = 1;
    IEx09.claim_points(
        contract_address=exercise_9_contract_address, array_len=5, array=numbers_array
    );

    //10
    let exercise_10_contract_address = 704471897108014414393459224136267066228147055654991659861659135062124782477;
    let (exercise_10b_address) = IEx10.ex10b_address(contract_address=exercise_10_contract_address);
    let (secret_value) = Iex10b.secret_value(contract_address=exercise_10b_address);
    IEx10.claim_points(
        contract_address=exercise_10_contract_address,
        secret_value_i_guess=secret_value,
        next_secret_value_i_chose=89,
    );

    return ();
}

@external
func call_ex_14_contract{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr}(){
    let address = 1979510590566356355949737127225466958756749883817120849503018481540560420447;
    IEx14.claim_points(contract_address=address);
    return ();
}