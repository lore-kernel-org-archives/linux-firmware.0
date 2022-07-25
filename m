Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5B9C43334
	for <linux-firmware@archiver.kernel.org>; Mon, 25 Jul 2022 18:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C982BC341D2; Mon, 25 Jul 2022 18:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B484BC341CD
	for <linux-firmware@kernel.org>; Mon, 25 Jul 2022 18:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658772995;
	bh=Mp3iM0M8mdUrM5E9Xp/Iqj0FszKHC6Sd3+CgHabv5M8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=pgx11z7IIHsAQW5mpqHHRiyaE/L59Nb57tp7UbOrCt2XJWSt2PEFJcKwYFDCndhiW
	 dPjdWIS2ffDacJknbHEwo/Py27m35rxtKX5r6TfLQP4VJQW8QvEoB4nK5NtfrUoYZw
	 QB2EdxMqfwNIqeGczNuZXKlh8BjyZwaB2Dsd7VDpRMhE32PI4dl8iUasREjy2pGxaT
	 u2kwwU5tcMB9Ls9V2001EpgTKOjB27xnSdehsKxEaNVfycyMkI7gkWWYrS/jNh2Ggy
	 Ztfb4rKrQRub1kv+/RksFBkjT3BVdd1iEEy+vvku/LYCY5G429PVWwAoGaOdRZS2cf
	 oC/0VWniHktHw==
Received: by mail-il1-f182.google.com with SMTP id 1so6093403ill.11
        for <linux-firmware@kernel.org>; Mon, 25 Jul 2022 11:16:35 -0700 (PDT)
X-Gm-Message-State: AJIora9FkCXvUxYb4t+h0OLtqYXgqFI1QUZXnWX8NUUQoCMZLXI220WA
	3O6m1rEL0x8xAGXzgZQJ1Frcyd1vVQZn3lGfQWU=
X-Google-Smtp-Source: AGRyM1vaRuXmFn2bmJDQZPDJ+9/r1Wj4RC0M0UPGXELbpNZMNeNFGI3NSkbMRK5COQOl9Jic5UvC2JhJsPypNaGJKDs=
X-Received: by 2002:a05:6e02:17cd:b0:2dd:8678:3637 with SMTP id
 z13-20020a056e0217cd00b002dd86783637mr304820ilu.97.1658772994937; Mon, 25 Jul
 2022 11:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_M8qck27Rm9WWO+dQY4s9z6qH9Yindc-hmqyS9=vKVpFg@mail.gmail.com>
 <CA+5PVA74wYdpWbHNrT2Sb=8VdCV-s6eH3PcdNX+n1B-=rXr3-Q@mail.gmail.com> <CADnq5_N5qZW3c_YUaAB2_9zp6kYHSfVR4KopexkFSi02W6nZbg@mail.gmail.com>
In-Reply-To: <CADnq5_N5qZW3c_YUaAB2_9zp6kYHSfVR4KopexkFSi02W6nZbg@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 25 Jul 2022 14:16:24 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5QBn1iFS8r-Lun7wEn55iRhxBWhZVhJk-X8sP_Bmq=ag@mail.gmail.com>
Message-ID: <CA+5PVA5QBn1iFS8r-Lun7wEn55iRhxBWhZVhJk-X8sP_Bmq=ag@mail.gmail.com>
Subject: Re: amdgpu firmware updates for 22.20
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Fri, Jul 22, 2022 at 2:10 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Thanks.  Unfortunately, I accidentally added a yellow carp file to the beige goby commit that should not have been there.  Please apply this partial revert patch.  Sorry about that.
>
> Alex
>
>
> On Tue, Jul 19, 2022 at 6:44 AM Josh Boyer <jwboyer@kernel.org> wrote:
>>
>> All applied and pushed out.  Thanks.
>>
>> josh
>>
>> On Mon, Jul 18, 2022 at 2:35 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>> >
>> > Hi,
>> >
>> > Updated amdgpu firmware.  Please apply.
>> >
>> > Thanks,
>> >
>> > Alex
