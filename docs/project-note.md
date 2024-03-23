# Project notes

## Project description

### Brief from the company

The company has two branches: `CN1` and `CN2`, which is the branches ID. The in depth information about branches in the table descriptions.

There will be three main servers and one publisher:

- `Server1`: is used to store all the information related to the branch `CN1`.
- `Server2`: is used to store all the information related to the branch `CN2`.
- `Server3`: is used to store a copy of the `NhanVien` and `Kho` of both branches. This server is used only for **searching information in the `NhanVien` and `Kho` table of all branches**.

The company has three main roles for an account: `CongTy`, `ChiNhanh`, `User`.

- For the `CongTy` role, each `login` can:
  1. Access to any branch to **read** data on two branches.
  1. Only read the branch data on one branch at the time.
  1. Read all reports of all branches.
  1. Create new `login` of `CongTy` role.
- For the `ChiNhanh` role, each `login` can:
  1. Read/Write forms of that related branch.
  1. Access only to that associated branch.
  1. Create login of `ChiNhanh` role belongs to that branch.
  1. Create login of `User` role.
- For the `User` role, each `login` can:
  1. Access only into the associated server.
  1. Update data on that their own branch.

## Database distribution strategy

### Stored Procedure strategy

- When writing SP for the project, try to write the SP on the subscriber first, run and test then add them into the publisher then publish it down to the subscribers.

- Since the `Server3` is used to store all the information of the table `Kho` and `NhanVien`. Therefore, when writing SP which require finding information related to those two tables, instead of returning to the publisher server, we will go to the `Server3`.

### Required features

On table `NhanVien`:

1. Create records
1. Delete records
1. Update records
1. Move an employee to another branch.
1. Reload all records
1. Pagination (Optional)
1. Undo (Optional)

> Note: For each branch, they can only see the **employees** belongs to that branch!

On table `VatTu`:

1. Create records
1. Delete records
1. Update records
1. Reload all records
1. Pagination (Optional)
1. Undo (Optional)

On table `Kho`:

1. Create records
1. Delete records
1. Update records
1. Reload all records
1. Pagination (Optional)
1. Undo (Optional)

> Note: For each branch, they can only see the **storage** belongs to that branch!

On table `DonDatHang`:

1. Create records
1. Delete records
1. Update records
1. Reload all records
1. Pagination (Optional)
1. Undo (Optional)
