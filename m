Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E1FC4332F
	for <linux-firmware@archiver.kernel.org>; Thu, 21 Apr 2022 15:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 07F1DC385AD; Thu, 21 Apr 2022 15:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6AA2C385A5
	for <linux-firmware@kernel.org>; Thu, 21 Apr 2022 15:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650553216;
	bh=4qU6R+oDtF/j1vzwuFr9zDoUdZ1Y/NXxB2JQS6pJPzM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=VmioLh68axuk5G4eAYSydlau9rZvctCRDtrIk0HvkXAWfJ7v05Kh2LMzSoIlIRkvJ
	 wjjRr9Ka1hQv9pR+LDk3mPugccoy1Cx038lU06OUgbTU+3KvQ1VUzrPdmtgMMRhrL0
	 tEYNR6LBDwRQVAy2T1mA80hBwTBcgsFWp2iVTZQd+utRP2UyElBeMs3HE0gR+N5A5X
	 xop4SaMA5S19WLCYbU322FO5rlaxlVANQWws3ECV+1vDv4bv7oN3nqDdLPSDVHsljL
	 AH0LESzmQXSjyO5KyghfXd9OWdtlxDTR6zAKzxQtwtxL3U6rWdHki089lQp0OJH5wa
	 Rmxeyt9Y/X8ow==
Received: by mail-io1-f44.google.com with SMTP id 125so5546966iov.10
        for <linux-firmware@kernel.org>; Thu, 21 Apr 2022 08:00:16 -0700 (PDT)
X-Gm-Message-State: AOAM533NHnK0PkGNR65CanpLqfVeHx+wbWfXo86kj+zV0x7qz4DNX72R
	8EO5rsLnCQ2zVBzvizzXojeBMh3Fd8pblm+TCEs=
X-Google-Smtp-Source: ABdhPJzxqb8EDmuGwW6y7dcM7gct8/TljGJmpzTPaOKTEkQXusUVy/XlCL1oHxcYiCUOlz5fsPTOE9EPuJz5rwur4mA=
X-Received: by 2002:a02:a40d:0:b0:326:72dd:feb8 with SMTP id
 c13-20020a02a40d000000b0032672ddfeb8mr12416675jal.303.1650553216076; Thu, 21
 Apr 2022 08:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_NnRNNVXXMN3=keE1W+DYP01Nv_A_Rr44p4YBObTXqqjA@mail.gmail.com>
 <CA+5PVA7D6suT1EhByhRXf_8kHWDdTDCwvf-Jey7Cu+3yrg3p=g@mail.gmail.com> <BL1PR12MB5157DE3485B79DC56FC7CA05E2F49@BL1PR12MB5157.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB5157DE3485B79DC56FC7CA05E2F49@BL1PR12MB5157.namprd12.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 21 Apr 2022 11:00:05 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7Ojt=z8NLMx15PyUS0BAEu7Wyn=Vw34PGmmaW0==eFow@mail.gmail.com>
Message-ID: <CA+5PVA7Ojt=z8NLMx15PyUS0BAEu7Wyn=Vw34PGmmaW0==eFow@mail.gmail.com>
Subject: Re: amdgpu firmware update
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Alex Deucher <alexdeucher@gmail.com>, Linux Firmware <linux-firmware@kernel.org>, 
	"Gong, Richard" <Richard.Gong@amd.com>, "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 21, 2022 at 10:32 AM Limonciello, Mario
<Mario.Limonciello@amd.com> wrote:
>
> [Public]
>
> Josh,
>
> Thanks for adding it.  I recall you were mentioning something about
> coming up with a process that will allow more committers to scale better
> for the future.  Is that still on TODO?

Yes, still a TODO unfortunately.

josh

> > -----Original Message-----
> > From: Josh Boyer <jwboyer@kernel.org>
> > Sent: Thursday, April 21, 2022 05:44
> > To: Alex Deucher <alexdeucher@gmail.com>
> > Cc: Linux Firmware <linux-firmware@kernel.org>; Limonciello, Mario
> > <Mario.Limonciello@amd.com>; Gong, Richard <Richard.Gong@amd.com>;
> > Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>
> > Subject: Re: amdgpu firmware update
> >
> > Applied and pushed out.
> >
> > josh
> >
> > On Wed, Apr 20, 2022 at 2:37 PM Alex Deucher <alexdeucher@gmail.com>
> > wrote:
> > >
> > > Hi,
> > >
> > > Updated DMCUB firmware for yellow carp.  Please apply!
> > >
> > > Thanks,
> > >
> > > Alex
