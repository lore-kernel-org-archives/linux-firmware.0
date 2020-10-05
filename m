Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10AEBC4363A
	for <linux-firmware@archiver.kernel.org>; Mon,  5 Oct 2020 11:58:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DD12C2080C; Mon,  5 Oct 2020 11:58:29 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B4B2320774
	for <linux-firmware@kernel.org>; Mon,  5 Oct 2020 11:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601899109;
	bh=dpltl05nKQBtVbeeUw1cf8yR2SM0056zaYcZnSGgxxI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=jgNhb6fKxVvVmpLCd2DW+QgY9w/dV4dYtMHQ4gtyyCRXT1YfUaiAyEQ93g1ArRO8x
	 M46szCj8JwlQxfoIhM2KCOmNVVd9cXpSlDhjRY9c0d918Kj1U7SALgzwF5zja6Dcn6
	 GmMWIpENFsw4vvcdF0Lg4nYLGKVwratGENsPKf+8=
Received: by mail-il1-f172.google.com with SMTP id q1so7490589ilt.6
        for <linux-firmware@kernel.org>; Mon, 05 Oct 2020 04:58:29 -0700 (PDT)
X-Gm-Message-State: AOAM532PU+B/h41tpLGT3Pe2PU96aa4Tfc/aNjrul6ZQ4vchYEo801bL
	U7aqrcg2fxRd82mKbtga+Vnfvv5EtF8+R1cVLgw=
X-Google-Smtp-Source: ABdhPJxZelpojpDBwGgsTe3X4XQo9BTOJBv5CS4Q9Ww1495qAk7nWnIIoYUd6/2aBu4ctlHS3aazbITxzqupL9dXxog=
X-Received: by 2002:a92:d742:: with SMTP id e2mr10903400ilq.11.1601899109039;
 Mon, 05 Oct 2020 04:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200928203303.32178-1-nikhil.nd@ti.com> <20200928203303.32178-2-nikhil.nd@ti.com>
In-Reply-To: <20200928203303.32178-2-nikhil.nd@ti.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 5 Oct 2020 07:58:18 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7VmtzUEQsH_Y7r1iHc9FY43-9kDYhLjNLXnHVyOv3khQ@mail.gmail.com>
Message-ID: <CA+5PVA7VmtzUEQsH_Y7r1iHc9FY43-9kDYhLjNLXnHVyOv3khQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] linux-firmware: Add new VPDMA firmware 1b8.bin
To: Nikhil Devshatwar <nikhil.nd@ti.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, dmurphy@ti.com, tomi.valkeinen@ti.com, 
	bparrot@ti.com, nsekhar@ti.com, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied and pushed out.

josh

On Mon, Sep 28, 2020 at 4:33 PM Nikhil Devshatwar <nikhil.nd@ti.com> wrote:
>
> Add a firmware for the VPDMA (Video Port Direct Memory Access)
> block of the VPE (Video Processing Engine) used in Texas
> Instrument's devices like dra7xx family.
>
> This firmware is required for the driver
> drivers/media/platform/ti-vpe/vpdma.c
>
> Origin: downloads.ti.com/dsps/dsps_public_sw/glsdk/vpdma-fw/03-2012/
>
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  LICENCE.ti-tspa               |  46 ++++++++++++++++++++++++++++++++++
>  WHENCE                        |   8 ++++++
>  ti-connectivity/vpdma-1b8.bin | Bin 0 -> 4002 bytes
>  3 files changed, 54 insertions(+)
>  create mode 100644 LICENCE.ti-tspa
>  create mode 100644 ti-connectivity/vpdma-1b8.bin
>
> diff --git a/LICENCE.ti-tspa b/LICENCE.ti-tspa
> new file mode 100644
> index 0000000..728fc2b
> --- /dev/null
> +++ b/LICENCE.ti-tspa
> @@ -0,0 +1,46 @@
> +TI TSPA License
> +TECHNOLOGY AND SOFTWARE PUBLICLY AVAILABLE
> +SOFTWARE LICENSE
> +
> +Copyright (c) 2020, Texas Instruments Incorporated.
> +
> +All rights reserved not granted herein.
> +
> +Limited License.
> +
> +Texas Instruments Incorporated grants a world-wide, royalty-free, non-ex=
clusive
> +license under copyrights and patents it now or hereafter owns or control=
s to
> +make, have made, use, import, offer to sell and sell ("Utilize") this so=
ftware,
> +but solely to the extent that any such patent is necessary to Utilize th=
e
> +software alone. The patent license shall not apply to any combinations w=
hich
> +include this software.  No hardware per se is licensed hereunder.
> +
> +Redistribution and use in binary form, without modification, are permitt=
ed
> +provided that the following conditions are met:
> +
> +* Redistributions must preserve existing copyright notices and reproduce=
 this
> +license (including the above copyright notice and the disclaimer below) =
in the
> +documentation and/or other materials provided with the distribution.
> +
> +* Neither the name of Texas Instruments Incorporated nor the names of it=
s
> +suppliers may be used to endorse or promote products derived from this s=
oftware
> +without specific prior written permission.
> +
> +* No reverse engineering, decompilation, or disassembly of this software=
 is
> +permitted.
> +
> +* Nothing shall obligate TI to provide you with source code for the soft=
ware
> +licensed and provided to you in object code.
> +
> +DISCLAIMER.
> +
> +THIS SOFTWARE IS PROVIDED BY TI AND TI=E2=80=99S LICENSORS "AS IS" AND A=
NY EXPRESS OR
> +IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIE=
S OF
> +MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN =
NO
> +EVENT SHALL TI AND TI=E2=80=99S LICENSORS BE LIABLE FOR ANY DIRECT, INDI=
RECT,
> +INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT=
 NOT
> +LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DA=
TA, OR
> +PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
> +LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
> +NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTW=
ARE,
> +EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> diff --git a/WHENCE b/WHENCE
> index d4bd8cf..77119ec 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2655,6 +2655,14 @@ File: TDA7706_OM_v3.0.2_boot.txt
>  Licence: Redistributable. See LICENCE.tda7706-firmware.txt for details.
>          Copyright =C2=A9 2010 STMicroelectronics
>
> +------------------------------------------------
> +
> +Driver: ti-vpe - Texas Instruments V4L2 driver for Video Processing Engi=
ne
> +
> +File: ti-connectivity/vpdma-1b8.bin
> +
> +Licence: Redistributable. See LICENCE.ti-tspa for details.
> +
>  ------------------------------------------------------------------------=
--
>
>  Driver: wl1251 - Texas Instruments 802.11 WLAN driver for WiLink4 chips
> diff --git a/ti-connectivity/vpdma-1b8.bin b/ti-connectivity/vpdma-1b8.bi=
n
> new file mode 100644
> index 0000000000000000000000000000000000000000..e36fdc548e67fd36d729513e1=
7f4bbcdabefc773
> GIT binary patch
> literal 4002
> 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
>
> literal 0
> HcmV?d00001
>
> --
> 2.17.1
>
