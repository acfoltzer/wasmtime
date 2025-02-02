;;! target = "riscv64"
;;!
;;! settings = ['enable_heap_access_spectre_mitigation=true']
;;!
;;! compile = true
;;!
;;! [globals.vmctx]
;;! type = "i64"
;;! vmctx = true
;;!
;;! [globals.heap_base]
;;! type = "i64"
;;! load = { base = "vmctx", offset = 0, readonly = true }
;;!
;;! # (no heap_bound global for static heaps)
;;!
;;! [[heaps]]
;;! base = "heap_base"
;;! min_size = 0x10000
;;! offset_guard_size = 0xffffffff
;;! index_type = "i64"
;;! style = { kind = "static", bound = 0x10000000 }

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i64 1)

  (func (export "do_store") (param i64 i32)
    local.get 0
    local.get 1
    i32.store8 offset=0x1000)

  (func (export "do_load") (param i64) (result i32)
    local.get 0
    i32.load8_u offset=0x1000))

;; function u0:0:
;; block0:
;;   lui a5,65535
;;   addi a3,a5,4095
;;   ugt a4,a0,a3##ty=i64
;;   ld a2,0(a2)
;;   add a0,a2,a0
;;   lui a2,1
;;   add a0,a0,a2
;;   li a3,0
;;   andi a2,a4,255
;;   sltu a2,zero,a2
;;   sub a4,zero,a2
;;   and a2,a3,a4
;;   not a3,a4
;;   and a4,a0,a3
;;   or a0,a2,a4
;;   sb a1,0(a0)
;;   j label1
;; block1:
;;   ret
;;
;; function u0:1:
;; block0:
;;   lui a5,65535
;;   addi a2,a5,4095
;;   ugt a3,a0,a2##ty=i64
;;   ld a1,0(a1)
;;   add a0,a1,a0
;;   lui a1,1
;;   add a0,a0,a1
;;   li a2,0
;;   andi a1,a3,255
;;   sltu a3,zero,a1
;;   sub a4,zero,a3
;;   and a1,a2,a4
;;   not a2,a4
;;   and a4,a0,a2
;;   or a0,a1,a4
;;   lbu a0,0(a0)
;;   j label1
;; block1:
;;   ret
