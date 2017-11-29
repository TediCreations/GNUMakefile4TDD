#-------------------------------------------------------------------------------
#	 _____                            _                 _           
#	|  __ \                          | |               (_)          
#	| |  | | ___ _ __   ___ _ __   __| | ___ _ __   ___ _  ___  ___ 
#	| |  | |/ _ \ '_ \ / _ \ '_ \ / _` |/ _ \ '_ \ / __| |/ _ \/ __|
#	| |__| |  __/ |_) |  __/ | | | (_| |  __/ | | | (__| |  __/\__ \
#	|_____/ \___| .__/ \___|_| |_|\__,_|\___|_| |_|\___|_|\___||___/
#	            | |                                                 
#	            |_|                                                 
#
#-------------------------------------------------------------------------------

################################################################################
################		Main		############################################
################################################################################

USER_C_INCs =			-I$(INC_DIR)\
						-I$(SRC_DIR)

USER_C_SRCs =			$(SRC_DIR)main.c

################################################################################
################		Assembled dependencies		############################
################################################################################

#-------------------------------------------------------------------------------
#						Host

ifeq ($(PLATFORM),host)
  #	Linux
  USER_ASM_INCs +=	
  
  USER_ASM_SRCs +=	

  USER_C_INCs +=	

  USER_C_SRCs +=	

endif

#-------------------------------------------------------------------------------
#						Target

ifeq ($(PLATFORM),target)
  # ARM
  USER_ASM_INCs +=	
  
  USER_ASM_SRCs +=		$(PORT_DIR)startup_stm32f072xb.s

  USER_C_INCs +=		-Ithirdparty/CMSIS/Device/ST/STM32F0xx/Include/\
						-Ithirdparty/CMSIS/Include/

  USER_C_SRCs +=		$(PORT_DIR)system_stm32f0xx.c

endif

#-------------------------------------------------------------------------------
#						Tests

USER_TEST_CXX_INCs += 	

USER_TEST_CXX_SRCs +=	$(TESTS_DIR)AllTests.cpp

USER_TEST_C_INCs +=		

USER_TEST_C_SRCs +=		

#-------------------------------------------------------------------------------
#	  ______ _                 
#	 |  ____| |                
#	 | |__  | | __ _  __ _ ___ 
#	 |  __| | |/ _` |/ _` / __|
#	 | |    | | (_| | (_| \__ \
#	 |_|    |_|\__,_|\__, |___/
#	                  __/ |    
#	                 |___/     
#
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
#						Compiler

ifeq ($(PLATFORM),target)

  USER_CFLAGS =				-DSTM32F072xB

endif

#-------------------------------------------------------------------------------
#						Linker script

TARGET_LDSCRIPT =			$(PORT_DIR)STM32F072RBTx_FLASH.ld
