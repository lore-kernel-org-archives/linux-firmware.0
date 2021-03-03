Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0558DC433E0
	for <linux-firmware@archiver.kernel.org>; Wed,  3 Mar 2021 17:58:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BFBF164EFC; Wed,  3 Mar 2021 17:58:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9956564EF8
	for <linux-firmware@kernel.org>; Wed,  3 Mar 2021 17:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614794310;
	bh=ZL2ApLv9wQ9HSK0bscUkBrtDCgIJKV434WG8+Yjm4LI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=RpGBQEm3JCB7m4a4RI5nMsIGJ67L+60ShT648pvCZQtdtGe736sg2XYbvj4w3esS+
	 DlSioib9rd4clGHpllNb2Nm8weYORLgttoVG0+bPt37DcyO2Cd7UC2zidK/gcCgvs6
	 NgJcOXApHtIxkwQP5DmDduwvezTohIHYeEGUfy4JYOk5bpKIQ8n6pAJtDl+bozlSCf
	 rfD7wd7wZFPDKAgegFPouW6KCXmm3uR9RtJz44FKBwUwtZrlD5bv2Vi8HHZqaS2XQq
	 av6WZ4QX7OnqDvOLWaGhitUEAIBxZzk2lqRfMmYsGx2+GOgSTHVl00Rqvje15XBQk8
	 68TbBM/d35TvQ==
Received: by mail-io1-f47.google.com with SMTP id 81so23035486iou.11
        for <linux-firmware@kernel.org>; Wed, 03 Mar 2021 09:58:30 -0800 (PST)
X-Gm-Message-State: AOAM533VctJ1W/Q0+ywqshOps+WQiu02Ag8UfphIEcJALHN+9H4X27Lg
	Ad7A2JjzWtGAqFrlhlZ1j7d/p454R7lLGAiaLos=
X-Google-Smtp-Source: ABdhPJxDSQ0Lm0TYBpgDJCikDL73qAZ48XdgT01GLgmd/VaZnZycahntVN9fKoMKy3tuPWyB4x+jsriLkHCgOOczvys=
X-Received: by 2002:a05:6602:314b:: with SMTP id m11mr305088ioy.158.1614794309899;
 Wed, 03 Mar 2021 09:58:29 -0800 (PST)
MIME-Version: 1.0
References: <20210216064202.15450-1-christianshewitt@gmail.com>
In-Reply-To: <20210216064202.15450-1-christianshewitt@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 3 Mar 2021 12:58:18 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6dvT3jKKb0wBnuaKaXuZ21Hs_XNJBy0p0C7f4t33GXYQ@mail.gmail.com>
Message-ID: <CA+5PVA6dvT3jKKb0wBnuaKaXuZ21Hs_XNJBy0p0C7f4t33GXYQ@mail.gmail.com>
Subject: Re: [PATCH] ti-connectivity: add firmware for WL1831 Bluetooth
To: Christian Hewitt <christianshewitt@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 16, 2021 at 1:42 AM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> This adds TIInit_11.8.32.bts to support the TI WL1831 chip used in
> the iMX6 Cubox-i v1.5 board (earlier versions used a Broadcom BCM4330
> module). Current firmware version is v4.6. The version in parentheses
> is found within the file. Also simplify installation wording in the
> WHENCE file.
>
> The upstream source [0] requires registration to download the firmware
> files, but the license included allows redistribution and contains the
> same wording as the current LICENSE.ti-connectivity file.
>
> [0] https://www.ti.com/tool/WL18XX-BT-SP

So I went and read the Terms of Service that one is implicitly
agreeing to by logging in to download the files.  Among other things,
they limit usage to non-commercial or personal use.  I have no idea
which takes precedent here.  Given that I'm not a lawyer and nobody
from TI has signed off on this, I'm not comfortable putting this in
the upstream linux-firmware tree.  I understand that may be
frustrating, but with binary firmware the only thing we can do is try
to adhere to a strict chain of custody to ensure we only include
firmware that we're able to redistribute without restriction.

josh

> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> License text shipped with the downloaded files copy/pasted below:
>
> >>>>>
>
> TEXAS INSTRUMENTS TEXT FILE LICENSE
>
>
> Copyright (c) 2008 =E2=80=93 2013 Texas Instruments Incorporated
>
> All rights reserved not granted herein.
>
> Limited License.
>
> Texas Instruments Incorporated grants a world-wide, royalty-free, non-exc=
lusive
> license under copyrights and patents it now or hereafter owns or controls=
 to make,
> have made, use, import, offer to sell and sell ("Utilize") this software =
subject
> to the terms herein.  With respect to the foregoing patent license, such =
license
> is granted solely to the extent that any such patent is necessary to Util=
ize the
> software alone.  The patent license shall not apply to any combinations w=
hich
> include this software, other than combinations with devices manufactured =
by or
> for TI (=E2=80=9CTI Devices=E2=80=9D).  No hardware patent is licensed he=
reunder.
>
> Redistributions must preserve existing copyright notices and reproduce th=
is license
> (including the above copyright notice and the disclaimer and (if applicab=
le) source
> code license limitations below) in the documentation and/or other materia=
ls provided
> with the distribution
>
> Redistribution and use in binary form, without modification, are permitte=
d provided
> that the following conditions are met:
>
> *   No reverse engineering, decompilation, or disassembly of this softwar=
e is permitted
>     with respect to any software provided in binary form.
>
> *   any redistribution and use are licensed by TI for use only with TI De=
vices.
>
> *   Nothing shall obligate TI to provide you with source code for the sof=
tware
>     licensed and provided to you in object code.
>
> If software source code is provided to you, modification and redistributi=
on of the
> source code are permitted provided that the following conditions are met:
>
> *   any redistribution and use of the source code, including any resultin=
g
>     derivative works, are licensed by TI for use only with TI Devices.
>
> *   any redistribution and use of any object code compiled from the sourc=
e
>     code and any resulting derivative works, are licensed by TI for use o=
nly
>     with TI Devices.
>
> Neither the name of Texas Instruments Incorporated nor the names of its s=
uppliers
> may be used to endorse or promote products derived from this software wit=
hout specific
> prior written permission.
>
> DISCLAIMER.
>
> THIS SOFTWARE IS PROVIDED BY TI AND TI=E2=80=99S LICENSORS "AS IS" AND AN=
Y EXPRESS
> OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANT=
IES
> OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. I=
N
> NO EVENT SHALL TI AND TI=E2=80=99S LICENSORS BE LIABLE FOR ANY DIRECT, IN=
DIRECT,
> INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
> NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
> DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THE=
ORY
> OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
> NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWA=
RE,
> EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
