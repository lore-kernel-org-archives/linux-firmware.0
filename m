Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F078E7717F
	for <linux-firmware@archiver.kernel.org>; Thu, 12 Dec 2024 17:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37C62C4CEDD; Thu, 12 Dec 2024 17:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22132C4CED4
	for <linux-firmware@kernel.org>; Thu, 12 Dec 2024 17:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734025571;
	bh=4BITubhjrlqiZXFh4LrVGxY7d8cLmvR+F7hUGhgGQTY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=SfFhLCu+TYAMF0jmmxalRKTF5Zv+bAE1zf+krtCVy8HooccSTw/+9p9E5PospsIVu
	 4e8je149+68DOfknwe7mtbzVU9+8NXtef4XsVz/gVpo/2Fn2YPOoOvTOdsITMLhyqI
	 79JtolmBJmOWYqIZRfQpWKzMfSrPeVDeq9pa9e3xpccJriaAQuWupdLlL7mOEJ3fPL
	 3JuKU5vKZICkaOttWgShPOMOKIk19XNfO3Y5QQvluaSUAn29o24MLa3iA2gjygP9Iq
	 Sg7519YuKYnsaDZ5Z5YQKRA+7GnVwjUkcX/AxME352c3EXvlCZg9Ot1g1OxxL8c73P
	 6d+N66xfIbGNw==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6ef6ffcc2dcso15126307b3.1
        for <linux-firmware@kernel.org>; Thu, 12 Dec 2024 09:46:11 -0800 (PST)
X-Gm-Message-State: AOJu0YxWegk4dRrKte3+uHxhx7Y+myPtray5szeqgDX9CgSm8aIgriAK
	HSh1SXaWUI4TvKC5oxDZQfuAmRU0V3UkOqxwAGXzXP98o8G6NO+UAg+K6xrdu4BajtEpErLVxXb
	eUyMxeufumv7GUfKQ8/dFfBmCHIo=
X-Google-Smtp-Source: AGHT+IF6zIhSPbT+Cki9RZJ71kTm/XYEM7DTp7Nj/hnpxt5Mex613MPQ9FdabXQCy4JYqoYB2s8PJUuEHKEgUcamSFI=
X-Received: by 2002:a05:690c:d88:b0:6e2:451c:df02 with SMTP id
 00721157ae682-6f276603b1dmr10542467b3.16.1734025570127; Thu, 12 Dec 2024
 09:46:10 -0800 (PST)
MIME-Version: 1.0
References: <007201db4cb2$b77d6660$26783320$@opensource.cirrus.com>
In-Reply-To: <007201db4cb2$b77d6660$26783320$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 12 Dec 2024 12:45:59 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7aF7j0JtRQ=E8ScmwBZMWbjFB29yes3ATSqjLBkbcTcA@mail.gmail.com>
Message-ID: <CA+5PVA7aF7j0JtRQ=E8ScmwBZMWbjFB29yes3ATSqjLBkbcTcA@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Update firmware for Cirrus CS35L56 Amps
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/388

josh

On Thu, Dec 12, 2024 at 11:27=E2=80=AFAM Simon Trimmer
<simont@opensource.cirrus.com> wrote:
>
> Hi,
>
> We=E2=80=99d like to update the firmware for the Cirrus CS35L56 smart amp=
lifier.
>
>
>
> There are two patches today, one correcting the order of SSIDs in the WHE=
NCE
>
> file to be saner and another that updates support for several products fr=
om
>
> Lenovo, HP and ASUS.
>
> Thanks,
>
> -Simon
>
>
>
>
>
> The following changes since commit bac8330ecc98a91b2e6d92b2311fbe11138d31=
e7:
>
>
>
>   Merge branch 'robot/patch-0-1733885393' into 'main' (2024-12-11 03:00:2=
8 +0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware/ cs35l56-20241212
>
>
>
> for you to fetch changes up to 9c46d10f8ea7a72d910ba5f5ebed7fcd2de31c71:
>
>
>
>   cirrus: cs35l56: Add and update firmware for various Cirrus CS35L54 and=
 CS35L56 laptops (2024-12-12 16:14:14 +0000)
>
>
>
> ----------------------------------------------------------------
>
> Simon Trimmer (2):
>
>       cirrus: cs35l56: Correct SSID order for 103c8d01 103c8d08 10431f43
>
>       cirrus: cs35l56: Add and update firmware for various Cirrus CS35L54=
 and CS35L56 laptops
>
>
>
> WHENCE                                               |  53 ++++++++++++++=
++++++++++++++++++++++++---------------
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d8c-amp1.bin        | Bin 7036 -> 7056 b=
ytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d8c-amp2.bin        | Bin 7036 -> 7056 b=
ytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d8d-amp1.bin        | Bin 7036 -> 7056 b=
ytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d8d-amp2.bin        | Bin 7036 -> 7056 b=
ytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d8e-amp1.bin        | Bin 7036 -> 7056 b=
ytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d8e-amp2.bin        | Bin 7040 -> 7060 b=
ytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8e14-amp1.bin        | Bin 7036 -> 7052 b=
ytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8e14-amp2.bin        | Bin 7036 -> 7056 b=
ytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8e15-amp1.bin        | Bin 7040 -> 7060 b=
ytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8e15-amp2.bin        | Bin 7036 -> 7056 b=
ytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8e1b-amp1.bin        | Bin 7100 -> 7124 b=
ytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8e1b-amp2.bin        | Bin 7100 -> 7124 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-103c8d90-amp1.bin        | Bin 7100 -> 7124 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-103c8d90-amp2.bin        | Bin 7100 -> 7124 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431df3-amp1.bin        | Bin 7896 -> 8240 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431df3-amp2.bin        | Bin 7900 -> 8248 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431df3-amp3.bin        | Bin 7896 -> 8248 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431df3-amp4.bin        | Bin 7896 -> 8236 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0-amp1.bin | Bin 8196 -> 8220 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid0-amp2.bin | Bin 8196 -> 8220 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid1-amp1.bin | Bin 8192 -> 8344 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431e63-spkid1-amp2.bin | Bin 8192 -> 8344 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid0-amp1.bin | Bin 8196 -> 8348 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid0-amp2.bin | Bin 8196 -> 8348 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1-amp1.bin | Bin 8192 -> 8344 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-10431e83-spkid1-amp2.bin | Bin 8192 -> 8344 b=
ytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid0-ampl.bin | Bin 0 -> 12892 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid0-ampr.bin | Bin 0 -> 12896 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid1-ampl.bin | Bin 0 -> 12872 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid1-ampr.bin | Bin 0 -> 12872 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-17aa233c-amp1.bin        | Bin 0 -> 11480 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-17aa233c-amp2.bin        | Bin 0 -> 11484 byt=
es
>
> cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid0-amp1.bin | Bin 0 -> 8700 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid0-amp2.bin | Bin 0 -> 8700 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid1-amp1.bin | Bin 0 -> 8756 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid1-amp2.bin | Bin 0 -> 8752 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-17aa3905-amp1.bin        | Bin 0 -> 7456 byte=
s
>
> cirrus/cs35l56-b0-dsp1-misc-17aa3905-amp2.bin        | Bin 0 -> 7456 byte=
s
>
> cirrus/cs35l56/CS35L56_Rev3.11.26.wmfw               | Bin 0 -> 34716 byt=
es
>
> cirrus/cs35l56/CS35L56_Rev3.11.28.wmfw               | Bin 0 -> 34964 byt=
es
>
> 41 files changed, 38 insertions(+), 15 deletions(-)
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid0-ampl.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid0-ampr.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid1-ampl.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa233b-spkid1-ampr.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa233c-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa233c-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid0-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid0-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid1-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3832-spkid1-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3905-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3905-amp2.bin
>
> create mode 100644 cirrus/cs35l56/CS35L56_Rev3.11.26.wmfw
>
> create mode 100644 cirrus/cs35l56/CS35L56_Rev3.11.28.wmfw
