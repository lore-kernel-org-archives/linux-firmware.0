Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CC8CCD1BF
	for <linux-firmware@archiver.kernel.org>; Fri, 24 Oct 2025 16:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1ADFC4CEFB; Fri, 24 Oct 2025 16:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBCFFC4CEFF
	for <linux-firmware@kernel.org>; Fri, 24 Oct 2025 16:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761323103;
	bh=stCZYsNbHXjC8Snx49HCzCYaLJ9Ss6xiRt4vub28St0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=G2OtzCOsENpJIgKhp2siZcPo+ZfPirSsZ+jetiUpG/Cic8+GNcGKlBlaO5l9/G/EH
	 tKT/rQMtvetPc/rSDrFFmSpdsTix/yACevBncRbyBRFHMOgwt9YoQ/0feEo4skhdzk
	 CSr0o8vB3sc9OrVKFdNjBNjtgfdqHjFcZNRNMifinvK1XwSGvMhrbARV6xav48a9Gn
	 QRWFS6hXhN35z+ZqA5UTV0dR4VnqSiSOz13PFVaidq+CCFcwPJL2uaTIbhTLD2+zTX
	 U3xkyUphJecvQGNbF6DD6jRXO2xRuMsyZnKeEmVlQjO2sYUBgYGXWJy7i5hNMKrBSH
	 GCtzdWiqJITCg==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-783fa3aa582so27845767b3.3
        for <linux-firmware@kernel.org>; Fri, 24 Oct 2025 09:25:03 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz6DrII7h5ElXoqZ0yAoq1itYArN/HCc80KpSuec4nfh+7uJCXZ
	3SaIRBMWYubFq5634swGujJCrPMs2B7etzfq6IkPf/3C2wn2iVLE0RfTCErGYydxolxrdhvMsQM
	UPoPSpSymrS10eiavlI3EsVW0htjYWPg=
X-Google-Smtp-Source: AGHT+IEHUgutqw7+bpRRitWPBYADuB/SbZuFlicK4wNByM0nfPtSgbGOp0lvifbNIAhNs2S7hiZiDyWQ5elh1wE0LZQ=
X-Received: by 2002:a05:690c:6109:b0:781:64f:3137 with SMTP id
 00721157ae682-7836d3a70c8mr241206847b3.69.1761323102893; Fri, 24 Oct 2025
 09:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <9d96eedd-c1de-488e-ac5a-d515d8d3563b@oss.qualcomm.com> <76de8198-d219-443c-9283-2811ab338c17@oss.qualcomm.com>
In-Reply-To: <76de8198-d219-443c-9283-2811ab338c17@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 24 Oct 2025 12:24:51 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5sjP5a9Jr3=5E5vM=jGP3JcA5ELKLuxd4JSVzG8avKdg@mail.gmail.com>
X-Gm-Features: AS18NWBXvkrelc2M0oSFFbbwIxMNesljHP8Ze1cFpHHk-oN-6soaKXCIdX0EaHs
Message-ID: <CA+5PVA5sjP5a9Jr3=5E5vM=jGP3JcA5ELKLuxd4JSVzG8avKdg@mail.gmail.com>
Subject: Re: [PULL]: Revert QDU100 firmware binaries
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 5:49=E2=80=AFAM Kishore Batta
<kishore.batta@oss.qualcomm.com> wrote:
>
> Hi,
>
> This is an updated pull request to reflect a corrected commit message.
>
> The following changes since commit 19731a36222e7b1ca09be090a19bfd89640a83=
7f:
>
>    Merge branch 'HP_Linux_Firmware_20251023' into 'main' (2025-10-23
> 13:30:10 +0000)
>
> are available in the Git repository at:
>
>    https://github.com/kishorebatta-ossqcom/del_linux_firmware.git
> del_firmware

We can merge this, but the firmware is already released and included
in a number of distributions.  Deleting it in the upstream repo isn't
going to remediate the license situation.

Which platforms is this going to break and how will it show up to the user?

josh

>
> for you to fetch changes up to 6cbada6d08a6ffda349ed68e4190563347512483:
>
>    qcom: Revert QDU100 firmware binaries (2025-10-24 15:17:21 +0530)
>
> ----------------------------------------------------------------
> Kishore Batta (1):
>        qcom: Revert QDU100 firmware binaries
>
>   WHENCE                          |  22 ----------------------
>   qcom/qdu100/abl_userdebug.elf   | Bin 212792 -> 0 bytes
>   qcom/qdu100/aop.mbn             | Bin 510944 -> 0 bytes
>   qcom/qdu100/aop_devcfg.mbn      | Bin 12136 -> 0 bytes
>   qcom/qdu100/cpucp.elf           | Bin 68576 -> 0 bytes
>   qcom/qdu100/efs1.bin            | Bin 512 -> 0 bytes
>   qcom/qdu100/efs2.bin            | Bin 512 -> 0 bytes
>   qcom/qdu100/efs3.bin            | Bin 512 -> 0 bytes
>   qcom/qdu100/fw_csm_gsi_3.0.elf  | Bin 20328 -> 0 bytes
>   qcom/qdu100/hypvm.mbn           | Bin 1358672 -> 0 bytes
>   qcom/qdu100/kernel_boot.elf     | Bin 49004344 -> 0 bytes
>   qcom/qdu100/mdmddr.mbn          | Bin 81960 -> 0 bytes
>   qcom/qdu100/multi_image.mbn     | Bin 12088 -> 0 bytes
>   qcom/qdu100/multi_image_qti.mbn | Bin 12088 -> 0 bytes
>   qcom/qdu100/qdsp6sw.mbn.xz      | Bin 5589248 -> 0 bytes
>   qcom/qdu100/qdsp6sw_dtbs.elf    | Bin 7992 -> 0 bytes
>   qcom/qdu100/qupv3fw.elf         | Bin 56432 -> 0 bytes
>   qcom/qdu100/shrm.elf            | Bin 82428 -> 0 bytes
>   qcom/qdu100/tz.mbn              | Bin 3186640 -> 0 bytes
>   qcom/qdu100/uefi.elf            | Bin 2666296 -> 0 bytes
>   qcom/qdu100/xbl_config.elf      | Bin 225368 -> 0 bytes
>   qcom/qdu100/xbl_ramdump.elf     | Bin 749464 -> 0 bytes
>   qcom/qdu100/zeros_1sector.bin   | Bin 512 -> 0 bytes
>   23 files changed, 22 deletions(-)
>   delete mode 100644 qcom/qdu100/abl_userdebug.elf
>   delete mode 100644 qcom/qdu100/aop.mbn
>   delete mode 100644 qcom/qdu100/aop_devcfg.mbn
>   delete mode 100644 qcom/qdu100/cpucp.elf
>   delete mode 100644 qcom/qdu100/efs1.bin
>   delete mode 100644 qcom/qdu100/efs2.bin
>   delete mode 100644 qcom/qdu100/efs3.bin
>   delete mode 100644 qcom/qdu100/fw_csm_gsi_3.0.elf
>   delete mode 100644 qcom/qdu100/hypvm.mbn
>   delete mode 100644 qcom/qdu100/kernel_boot.elf
>   delete mode 100644 qcom/qdu100/mdmddr.mbn
>   delete mode 100644 qcom/qdu100/multi_image.mbn
>   delete mode 100644 qcom/qdu100/multi_image_qti.mbn
>   delete mode 100644 qcom/qdu100/qdsp6sw.mbn.xz
>   delete mode 100644 qcom/qdu100/qdsp6sw_dtbs.elf
>   delete mode 100644 qcom/qdu100/qupv3fw.elf
>   delete mode 100644 qcom/qdu100/shrm.elf
>   delete mode 100644 qcom/qdu100/tz.mbn
>   delete mode 100644 qcom/qdu100/uefi.elf
>   delete mode 100644 qcom/qdu100/xbl_config.elf
>   delete mode 100644 qcom/qdu100/xbl_ramdump.elf
>   delete mode 100644 qcom/qdu100/zeros_1sector.bin
>
> -----------------------------------------------------------------
>
> On 10/24/2025 3:07 PM, Kishore Batta wrote:
> > The following changes since commit
> > 19731a36222e7b1ca09be090a19bfd89640a837f:
> >
> >   Merge branch 'HP_Linux_Firmware_20251023' into 'main' (2025-10-23
> > 13:30:10 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/kishorebatta-ossqcom/del_linux_firmware.git
> > del_firmware
> >
> > for you to fetch changes up to 5f77f6bd970a5ffecf049ea4231363b5144e1dd8=
:
> >
> >   qcom: Revert QDU100 firmware binaries due to licensing concerns
> > (2025-10-24 14:51:32 +0530)
> >
> > ----------------------------------------------------------------
> > Kishore Batta (1):
> >       qcom: Revert QDU100 firmware binaries due to licensing concerns
> >
> >  WHENCE                          |  22 ----------------------
> >  qcom/qdu100/abl_userdebug.elf   | Bin 212792 -> 0 bytes
> >  qcom/qdu100/aop.mbn             | Bin 510944 -> 0 bytes
> >  qcom/qdu100/aop_devcfg.mbn      | Bin 12136 -> 0 bytes
> >  qcom/qdu100/cpucp.elf           | Bin 68576 -> 0 bytes
> >  qcom/qdu100/efs1.bin            | Bin 512 -> 0 bytes
> >  qcom/qdu100/efs2.bin            | Bin 512 -> 0 bytes
> >  qcom/qdu100/efs3.bin            | Bin 512 -> 0 bytes
> >  qcom/qdu100/fw_csm_gsi_3.0.elf  | Bin 20328 -> 0 bytes
> >  qcom/qdu100/hypvm.mbn           | Bin 1358672 -> 0 bytes
> >  qcom/qdu100/kernel_boot.elf     | Bin 49004344 -> 0 bytes
> >  qcom/qdu100/mdmddr.mbn          | Bin 81960 -> 0 bytes
> >  qcom/qdu100/multi_image.mbn     | Bin 12088 -> 0 bytes
> >  qcom/qdu100/multi_image_qti.mbn | Bin 12088 -> 0 bytes
> >  qcom/qdu100/qdsp6sw.mbn.xz      | Bin 5589248 -> 0 bytes
> >  qcom/qdu100/qdsp6sw_dtbs.elf    | Bin 7992 -> 0 bytes
> >  qcom/qdu100/qupv3fw.elf         | Bin 56432 -> 0 bytes
> >  qcom/qdu100/shrm.elf            | Bin 82428 -> 0 bytes
> >  qcom/qdu100/tz.mbn              | Bin 3186640 -> 0 bytes
> >  qcom/qdu100/uefi.elf            | Bin 2666296 -> 0 bytes
> >  qcom/qdu100/xbl_config.elf      | Bin 225368 -> 0 bytes
> >  qcom/qdu100/xbl_ramdump.elf     | Bin 749464 -> 0 bytes
> >  qcom/qdu100/zeros_1sector.bin   | Bin 512 -> 0 bytes
> >  23 files changed, 22 deletions(-)
> >  delete mode 100644 qcom/qdu100/abl_userdebug.elf
> >  delete mode 100644 qcom/qdu100/aop.mbn
> >  delete mode 100644 qcom/qdu100/aop_devcfg.mbn
> >  delete mode 100644 qcom/qdu100/cpucp.elf
> >  delete mode 100644 qcom/qdu100/efs1.bin
> >  delete mode 100644 qcom/qdu100/efs2.bin
> >  delete mode 100644 qcom/qdu100/efs3.bin
> >  delete mode 100644 qcom/qdu100/fw_csm_gsi_3.0.elf
> >  delete mode 100644 qcom/qdu100/hypvm.mbn
> >  delete mode 100644 qcom/qdu100/kernel_boot.elf
> >  delete mode 100644 qcom/qdu100/mdmddr.mbn
> >  delete mode 100644 qcom/qdu100/multi_image.mbn
> >  delete mode 100644 qcom/qdu100/multi_image_qti.mbn
> >  delete mode 100644 qcom/qdu100/qdsp6sw.mbn.xz
> >  delete mode 100644 qcom/qdu100/qdsp6sw_dtbs.elf
> >  delete mode 100644 qcom/qdu100/qupv3fw.elf
> >  delete mode 100644 qcom/qdu100/shrm.elf
> >  delete mode 100644 qcom/qdu100/tz.mbn
> >  delete mode 100644 qcom/qdu100/uefi.elf
> >  delete mode 100644 qcom/qdu100/xbl_config.elf
> >  delete mode 100644 qcom/qdu100/xbl_ramdump.elf
> >  delete mode 100644 qcom/qdu100/zeros_1sector.bin
> >
