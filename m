Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EC8C433EF
	for <linux-firmware@archiver.kernel.org>; Mon, 25 Jul 2022 18:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 392C8C341CE; Mon, 25 Jul 2022 18:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 226DBC341C6
	for <linux-firmware@kernel.org>; Mon, 25 Jul 2022 18:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658772876;
	bh=D5G1g2G4hC09r4GZB4lwoM64yu7c4A2KOkn8w737rq4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=FHH7gK8S1s7L30JgN35nj4hUOGujH3YatU0nRYtbapHlPaKCK7WLDbiahbRRU+fwe
	 y915vAkCBHHXfcyGYCizMAocMVNsSbiPNfb9m5VP+Yf4KNTzQ7KZ3IP27Y6YQBe9WH
	 0/aA3erqtP0p6DLvbkMfpglG062jkuXA96yaco54AxHVQ/6SdPVR1I9mdnAs715X4O
	 aOI4EbbEeRHZt0p4Ow/ZKsbXggPriY/vZb8Px04WfR/HnzGmMP1GDyXhqefvtHHIBR
	 iujbJyZDr8/ZWI8gz/+5kPHW9PGCC7A5ULt3o5/hQjaT9RgzrGi32x1veYtYYdC6XY
	 N4C6w6h1AK0ug==
Received: by mail-il1-f177.google.com with SMTP id i5so6117532ila.6
        for <linux-firmware@kernel.org>; Mon, 25 Jul 2022 11:14:36 -0700 (PDT)
X-Gm-Message-State: AJIora9CPUBXjlGeQb9iuhxcEiPgXyp89QtLz4x+mgIB4DKr/qJmCEAL
	EH6BgPC0abHxr0BzrKwAUrLSHmTUMSYF40WQ1no=
X-Google-Smtp-Source: AGRyM1uFcNLTapVcVI6t9ksJjFWEa+kdZWvOSzNNaXEkjAogIeP3/C9YtTcMp2lJf2BBGlMFfBF68r3CiSn+77lhHCQ=
X-Received: by 2002:a92:c647:0:b0:2dd:2218:14c with SMTP id
 7-20020a92c647000000b002dd2218014cmr5125399ill.251.1658772875150; Mon, 25 Jul
 2022 11:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <515183d5-eb68-f3be-e82e-de563d20c96d@cirrus.com>
In-Reply-To: <515183d5-eb68-f3be-e82e-de563d20c96d@cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 25 Jul 2022 14:14:24 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5bzoVcSh2w+qX2HeZ0ETG5FUoYYkB_s9DAnq69Y+8bZA@mail.gmail.com>
Message-ID: <CA+5PVA5bzoVcSh2w+qX2HeZ0ETG5FUoYYkB_s9DAnq69Y+8bZA@mail.gmail.com>
Subject: Re: [PULL linux-firmware] Add firmware for Cirrus CS35L41
To: Vitaly Rodionov <vitaly.rodionov@cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2022 at 11:56 AM Vitaly Rodionov
<vitaly.rodionov@cirrus.com> wrote:
>
> Hi,
>
> We are adding firmware files to support Cirrus Logic smart amplifier CS35=
L41
>
> Please, let me know if there are any problems.
>
> Thanks,
>
> Vitaly
>
> The following changes since commit dfa29317dd78f3a18f37ef8063efe9d2659e63=
87:
>
>
>    WHENCE: Correct dangling symlinks (2022-07-10 09:21:51 -0400)
>
> are available in the Git repository at:
>
>    https://github.com/CirrusLogic/linux-firmware.git main
>
> for you to fetch changes up to 6383ab27f3cc36cd2428167ca7834013e2948604:
>
>    linux-firmware: Add firmware for Cirrus CS35L41 (2022-07-21 15:36:03
> +0100)
>
> ----------------------------------------------------------------
> Vitaly Rodionov (1):
>        linux-firmware: Add firmware for Cirrus CS35L41
>
>   LICENSE.cirrus                    | 285
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++

I'm sorry, but I don't think this license is acceptable for a general
purpose firmware redistribution project.  Among the primary concerns
is clause iv of the RESTRICTIONS section which states:

"iv) sell, assign, encumber, time share, rent, lease, lend, distribute,
localize, or port the Software, allow remote access to the Software, or pla=
ce
the Software on any publicly accessible internet site;"

Essentially, that's forbidding redistribution and hosting in a general
purpose repository as best as I can tell.  The distribution clause
above seems to be tied to distribution with a Cirrus product which is
not what this repository does.  I can't see how this license permits
redistribution as worded.  There are some other clauses that are
confusing or concerning as well, but unambiguous redistribution of the
binary firmware is the bare minimum.

josh

>   WHENCE                            |  16 ++++++++++
>   cirrus/cs35l41-dsp1-spk-prot.bin  | Bin 0 -> 948 bytes
>   cirrus/cs35l41-dsp1-spk-prot.wmfw | Bin 0 -> 34056 bytes
>   4 files changed, 301 insertions(+)
>   create mode 100644 LICENSE.cirrus
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot.bin
>   create mode 100644 cirrus/cs35l41-dsp1-spk-prot.wmfw
>
> This message and any attachments may contain privileged and confidential =
information that is intended solely for the person(s) to whom it is address=
ed. If you are not an intended recipient you must not: read; copy; distribu=
te; discuss; take any action in or make any reliance upon the contents of t=
his message; nor open or read any attachment. If you have received this mes=
sage in error, please notify us as soon as possible on the following teleph=
one number and destroy this message including any attachments. Thank you. C=
irrus Logic International (UK) Ltd and Cirrus Logic International Semicondu=
ctor Ltd are companies registered in Scotland, with registered numbers SC08=
9839 and SC495735 respectively. Our registered office is at 7B Nightingale =
Way, Quartermile, Edinburgh, EH3 9EG, UK. Tel: +44 (0)131 272 7000. cirrus.=
com
