<template>
    <div class="flex flex-col items-center bg-[#e9efff] h-[1100px]">
        <div class="mt-[10px] flex flex-col justify-center items-center w-[1100px] h-[1000px] bg-[#FFFFFF]">
            <div class="w-[800px] flex flex-row justify-around items-center h-[200px] mt-[50px]">
                <div class="flex flex-col">
                    <span class="text-[17px] font-[600]">Đơn vị: Cửa hàng điện thoại Danny Store</span>
                    <span class="text-[17px] font-[600]">Bộ phận:
                        ...........................................................</span>
                </div>
                <div class="flex flex-col justify-center items-center">
                    <span class="text-[17px] font-[600]">Mẫu số 01 - VT</span>
                    <span class="text-[17px] font-[600]">(Ban hành theo Thông tư số 133/2016/TT-BTC</span>
                    <span class="text-[17px] font-[600]">Ngày 26/08/2016 của Bộ tài chính)</span>
                </div>
            </div>
            <div class="w-[800px] flex flex-row justify-around">
                <div class="flex flex-col items-center">
                    <span class="text-[30px] font-[600]">Phiếu nhập kho</span>
                    <span class="italic text-[17px]">Ngày....tháng...năm.....</span>
                    <span class="italic text-[17px]">Số.......................</span>
                </div>
            </div>
            <div class="w-[800px] flex flex-col">
                <span>- Họ và tên người
                    giao:.............................................................................................................................................................................</span>
                <span>- Theo .......số......Ngày.... tháng .... năm .......
                    của..................................................................................................................................</span>
                <span>Nhập tại kho: ............................địa
                    điểm...............................................................................................................................................</span>
            </div>
            <div class="w-[1000px] flex flex-col mt-[10px]">
                <div class="w-[1000px] flex flex-row justify-between">
                    <div class="w-[400px] flex flex-row border">
                        <div class="w-[100px] flex justify-center items-center border">
                            <span>STT</span>
                        </div>
                        <div class="w-[300px] flex justify-center items-center">
                            <span>Tên, nhãn hiệu, quy cách, phẩm chất vật tư, dụng cụ, sản phẩm, hàng hóa</span>
                        </div>
                    </div>
                    <div class="w-[600px] flex flex-row border">
                        <div class="w-[100px] flex justify-center items-center">
                            <span>Mã số</span>
                        </div>
                        <div class="w-[133px] flex justify-center items-center border">
                            <span>Đơn vị tính</span>
                        </div>
                        <div class="w-[100px] flex justify-center items-center">
                            <span>Số lượng</span>
                        </div>
                        <div class="w-[133px] flex justify-center items-center border">
                            <span>Đơn giá</span>
                        </div>
                        <div class="w-[133px] flex justify-center items-center">
                            <span>Số tiền</span>
                        </div>
                    </div>
                </div>
                <div v-for="item in 5">
                    <div class="w-[1000px] flex flex-row justify-between">
                        <div class="w-[400px] flex flex-row">
                            <div class="w-[100px] flex justify-center items-center border">
                                <span>{{ item }}</span>
                            </div>
                            <div class="w-[300px] flex justify-center items-center border">
                                <span></span>
                            </div>
                        </div>
                        <div class="w-[600px] flex flex-row">
                            <div class="w-[100px] flex justify-center items-center border">
                                <span></span>
                            </div>
                            <div class="w-[133px] flex justify-center items-center border">
                                <span></span>
                            </div>
                            <div class="w-[100px] flex justify-center items-center border">
                                <span></span>
                            </div>
                            <div class="w-[133px] flex justify-center items-center border">
                                <span></span>
                            </div>
                            <div class="w-[133px] flex justify-center items-center border">
                                <span></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="w-[1000px] flex flex-row mt-[15px]">
                    <span>Tổng số tiền ( viết bằng chữ
                        ):....................................................................................................................................................................................................................</span>
                </div>
                <div class="w-[1000px] flex flex-row mt-[5px]">
                    <span>Số chứng từ gốc kèm
                        theo:......................................................................................................................................</span>
                    <span>.....................................................................................</span>
                </div>
                <div class="w-[1000px] flex flex-row justify-around mt-[15px] h-[250px]">
                    <div class="flex flex-col justify-center items-center">
                        <span class="text-[17px] font-[600]">Người lập phiếu</span>
                        <span>(Ký, họ tên)</span>
                    </div>
                    <div class="flex flex-col justify-center items-center">
                        <span class="text-[17px] font-[600]">Người lập phiếu</span>
                        <span>(Ký, họ tên)</span>
                    </div>
                    <div class="flex flex-col justify-center items-center">
                        <span class="text-[17px] font-[600]">Nhân viên kho</span>
                        <span>(Ký, họ tên)</span>
                    </div>
                    <div class="flex flex-col justify-center items-center">
                        <span class="text-[17px] font-[600]">Cửa hàng trưởng</span>
                        <span>(Ký, họ tên)</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>