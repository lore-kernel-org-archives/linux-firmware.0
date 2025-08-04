Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93554C87FCF
	for <linux-firmware@archiver.kernel.org>; Mon,  4 Aug 2025 16:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5322AC4CEF7; Mon,  4 Aug 2025 16:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C0B2C4CEE7
	for <linux-firmware@kernel.org>; Mon,  4 Aug 2025 16:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754323201;
	bh=s2DWoJqpDBTMgFo4lwSkk3OKKfefeXevPA2I9JS15CA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=GJEoLIPKj8Rp/3gH8CuPVYWCV0mrtL9KvSe8EJNTeoTtYIY1cI+j7Kp0jhDcH++1L
	 PTd2+NvUiXXlRQwMAL+xpz2UK3Bw+V2YnHYq+eZ3M9bceDo5ymHj21ehT/zZb3Ci3W
	 /FrVqLNiEOELa/cDzSHznQ8T4fLXR3Rir2MZ+zMLzc/LOh14v7vsq2xKwJoU1nduGw
	 EJA4rjzPjv4ebRah6BbEfX7wXC369vk70j5BsAhszGJUmu3Xvt117JiDvMkqhO4QC5
	 B2sbANvlQA3iq/WM3fg9HjNDKKXzVRigOoFsm5/Bje1vgyZ8tfgYT2fT4NTQsRlmXy
	 I1UJv2kcr3VxA==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-717b580ff2aso40404617b3.0
        for <linux-firmware@kernel.org>; Mon, 04 Aug 2025 09:00:01 -0700 (PDT)
X-Gm-Message-State: AOJu0Yzw9zLimXsgv9BWF8ThsW8EmSTj6V3vaZrzFxwV27oUY4weuhvi
	6ijHaAK0g3fjT1E2hfX9JFVdqM4MGWUbdlK3sGwVvCC+P0XZgOT9EZsDgrr9Bm6WC/z7bSYIBfk
	TGr9hYNhUzaN9iqGPd1KnUFlNXRgeXWw=
X-Google-Smtp-Source: AGHT+IFbAfzk9Y809P1WGzwlaUHf+8N9GetVNrWcEN4xuSOaCT2dmJbjMhvqeyZhk4xR8xSUOpWJ89q2PhDOsbBWBd8=
X-Received: by 2002:a05:690c:9d:b0:71a:234c:aaa8 with SMTP id
 00721157ae682-71b7f0c5533mr145291537b3.2.1754323200125; Mon, 04 Aug 2025
 09:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <bbb85980-08a1-4413-bc14-7154583cf258@oss.qualcomm.com>
In-Reply-To: <bbb85980-08a1-4413-bc14-7154583cf258@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 4 Aug 2025 11:59:47 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4xwn9tvZ7vumLYZTgnzjytApLz61HjTJ-ENO5Z-FKcSA@mail.gmail.com>
X-Gm-Features: Ac12FXyfE33IBVOXbD2vGWW6KQLUkPAtyobWl1uJHs1vAc2REk_2w2CBzboOYMw
Message-ID: <CA+5PVA4xwn9tvZ7vumLYZTgnzjytApLz61HjTJ-ENO5Z-FKcSA@mail.gmail.com>
Subject: Re: [PULL]: Add QDU100 firmware image files required for booting.
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 2, 2025 at 6:21=E2=80=AFAM Kishore Batta
<kishore.batta@oss.qualcomm.com> wrote:
>
> The following changes since commit 910c190740916a9969ad5105137fb88ae4ce34=
c8:
>
>   Merge branch 'intel/dmc/xe3lpd/2.29' into 'main' (2025-07-30 00:18:22 +=
0000)
>
> are available in the Git repository at:
>
>   https://github.com/kishorebatta-ossqcom/linux-firmware.git qdu100_firmw=
are

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/634


josh

>
> for you to fetch changes up to dcec874b15615bdde99acb9f2d39572eb14f4c24:
>
>   qcom: Add QDU100 firmware image files required for booting. (2025-08-02=
 15:39:06 +0530)
>
> ----------------------------------------------------------------
> Kishore Batta (1):
>       qcom: Add QDU100 firmware image files required for booting.
>
>  WHENCE                          |  21 +++++++++++++++++++++
>  qcom/qdu100/abl_userdebug.elf   | Bin 0 -> 212792 bytes
>  qcom/qdu100/aop.mbn             | Bin 0 -> 510944 bytes
>  qcom/qdu100/aop_devcfg.mbn      | Bin 0 -> 12136 bytes
>  qcom/qdu100/cpucp.elf           | Bin 0 -> 68576 bytes
>  qcom/qdu100/efs1.bin            | Bin 0 -> 512 bytes
>  qcom/qdu100/efs2.bin            | Bin 0 -> 512 bytes
>  qcom/qdu100/efs3.bin            | Bin 0 -> 512 bytes
>  qcom/qdu100/fw_csm_gsi_3.0.elf  | Bin 0 -> 20328 bytes
>  qcom/qdu100/hypvm.mbn           | Bin 0 -> 1358672 bytes
>  qcom/qdu100/kernel_boot.elf     | Bin 0 -> 49004344 bytes
>  qcom/qdu100/mdmddr.mbn          | Bin 0 -> 81960 bytes
>  qcom/qdu100/multi_image.mbn     | Bin 0 -> 12088 bytes
>  qcom/qdu100/multi_image_qti.mbn | Bin 0 -> 12088 bytes
>  qcom/qdu100/qdsp6sw_dtbs.elf    | Bin 0 -> 7992 bytes
>  qcom/qdu100/qupv3fw.elf         | Bin 0 -> 56432 bytes
>  qcom/qdu100/shrm.elf            | Bin 0 -> 82428 bytes
>  qcom/qdu100/tz.mbn              | Bin 0 -> 3186640 bytes
>  qcom/qdu100/uefi.elf            | Bin 0 -> 2666296 bytes
>  qcom/qdu100/xbl_config.elf      | Bin 0 -> 225368 bytes
>  qcom/qdu100/xbl_ramdump.elf     | Bin 0 -> 749464 bytes
>  qcom/qdu100/xbl_s.melf          | Bin 1424292 -> 1444772 bytes
>  qcom/qdu100/zeros_1sector.bin   | Bin 0 -> 512 bytes
>  23 files changed, 21 insertions(+)
>  create mode 100644 qcom/qdu100/abl_userdebug.elf
>  create mode 100644 qcom/qdu100/aop.mbn
>  create mode 100644 qcom/qdu100/aop_devcfg.mbn
>  create mode 100644 qcom/qdu100/cpucp.elf
>  create mode 100644 qcom/qdu100/efs1.bin
>  create mode 100644 qcom/qdu100/efs2.bin
>  create mode 100644 qcom/qdu100/efs3.bin
>  create mode 100644 qcom/qdu100/fw_csm_gsi_3.0.elf
>  create mode 100644 qcom/qdu100/hypvm.mbn
>  create mode 100644 qcom/qdu100/kernel_boot.elf
>  create mode 100644 qcom/qdu100/mdmddr.mbn
>  create mode 100644 qcom/qdu100/multi_image.mbn
>  create mode 100644 qcom/qdu100/multi_image_qti.mbn
>  create mode 100644 qcom/qdu100/qdsp6sw_dtbs.elf
>  create mode 100644 qcom/qdu100/qupv3fw.elf
>  create mode 100644 qcom/qdu100/shrm.elf
>  create mode 100644 qcom/qdu100/tz.mbn
>  create mode 100644 qcom/qdu100/uefi.elf
>  create mode 100644 qcom/qdu100/xbl_config.elf
>  create mode 100644 qcom/qdu100/xbl_ramdump.elf
>  create mode 100644 qcom/qdu100/zeros_1sector.bin
>
