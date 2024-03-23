create proc sp_dong_diem()
    @nien_khoa nvarchar(10),
    @hoc_ki nvarchar(10),
    @ma_monhoc nvarchar(10),
    @nhom nvarchar(10)
as
set xact_abort on 
begin
    begin tran
    begin try
        update dangky set diem_ck = diem_ck + 2
        where dangki.maltc = (select maltc from loptinchi
            where loptinchi.nienkhoa = @nien_khoa
            and loptinchi.hocki = @hoc_ki
            and loptinchi.mamh = @ma_monhoc
            and loptinchi.nhom = @nhom
        )

        commit
    end try
    begin catch
        ROLLBACK
        DECLARE @ErrorMessage VARCHAR(2000)
        SELECT @ErrorMessage = 'Lỗi: ' + ERROR_MESSAGE()
        RAISERROR(@ErrorMessage, 16, 1)
    end catch
end