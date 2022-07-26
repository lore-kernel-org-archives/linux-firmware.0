Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9F3C43334
	for <linux-firmware@archiver.kernel.org>; Tue, 26 Jul 2022 10:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B54A1C341C8; Tue, 26 Jul 2022 10:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A7B6C341CD
	for <linux-firmware@kernel.org>; Tue, 26 Jul 2022 10:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658832982;
	bh=QwZULy9PDS7/n0AJDOiFE/UfiB0Wi8miKrbrTwdJ0hQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=TVQKmsXThAREbKxebqt2UAdVNJsMPlqDOmHis+j8kFAnIF/gDrWJOx6dr3vlIn7eP
	 +QrneFPOOXLm4eRxhIuGg/27qQjOOzjD+J+EVTmCQLtZ0l+SUKYvUxr4lZVPt5W5V9
	 h1jaskABeM8RfAr3lbI+Hk/rvUfT8RJflkDTW0KnCocwKoBqO4xJeweEhgEK6C+ztD
	 5Tw8SnMEE/GXFhSeRTiiJLhl3Od8NvD4lGOjmVpfyIs0miyiYxl2rh//b8FWeEqXHA
	 IXo3KRHn6gzebxRP872t/6N+nZln+RIfrX8Z+HBFtEDyBsuQuniL4eK9cYV166Davk
	 qfvvvPY/w5vhg==
Received: by mail-il1-f176.google.com with SMTP id y13so6974448ilv.5
        for <linux-firmware@kernel.org>; Tue, 26 Jul 2022 03:56:22 -0700 (PDT)
X-Gm-Message-State: AJIora+ClatVwnLJWxUUW2dxPEef+zhH8PtzzOoQSotrSz6DF2oFaYmM
	ododjh89bbqx2eCR0IMfUEFgNtSMXqiCvDiTx7Y=
X-Google-Smtp-Source: AGRyM1vU77rIJ+3nYsRDPEjgFf4z7qhG+Aa9Iosg6gDwOEzQK7GOC0ARoUaE1MZ0FjwLDx1rjvFRWBlYTQRhqxK5JP8=
X-Received: by 2002:a05:6e02:1aa5:b0:2dc:8302:5dc3 with SMTP id
 l5-20020a056e021aa500b002dc83025dc3mr6051251ilv.243.1658832981754; Tue, 26
 Jul 2022 03:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAHrc+6k2hy20_3yrTGBsp9n3c2t0wkZymd1e+EiU_R_R3phD4g@mail.gmail.com>
 <CA+5PVA47kz3y=xCsnsQdj8XeJV+HaKPRVSOnan6BWSwfABQ_dw@mail.gmail.com> <CALYqZ9mo_naXWaR-+vKRCQNA_YN3d-znNVwwSqnLfoPiFz8G5g@mail.gmail.com>
In-Reply-To: <CALYqZ9mo_naXWaR-+vKRCQNA_YN3d-znNVwwSqnLfoPiFz8G5g@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 26 Jul 2022 06:56:10 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6ZEPLk=1a5YKrWsw0FYSXV0hw62H7Pg-cPZomxcyUa2Q@mail.gmail.com>
Message-ID: <CA+5PVA6ZEPLk=1a5YKrWsw0FYSXV0hw62H7Pg-cPZomxcyUa2Q@mail.gmail.com>
Subject: Re: New pull request?
To: Eric Debief <debief@digigram.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: =?UTF-8?B?TG/Dr2MgQm9pc3N5?= <boissy@digigram.com>, 
	Linux Firmware <linux-firmware@kernel.org>, Yoann Lubiato <lubiato@digigram.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2022 at 2:57 AM Eric Debief <debief@digigram.com> wrote:
>
> Hi Josh,
>
> Thanks for your quick reply and your help.
> We will follow your advice.
>
> Could we come back to you if we have any questions ?

Yes, of course.

josh

> Le lun. 25 juil. 2022 =C3=A0 20:23, Josh Boyer <jwboyer@kernel.org> a =C3=
=A9crit :
>>
>> On Thu, Jul 21, 2022 at 4:23 AM Lo=C3=AFc Boissy <boissy@digigram.com> w=
rote:
>> >
>> > Hello,
>> > I am Lo=C3=AFc BOISSY. I work for Digigram company in France.
>> > Digigram is an audio card manufacturer for professional customers.
>> >
>> > Our old cards used specific firmware files.
>> > These files were provided by the alsa-firmware package.
>> > But it seems that this package is now deprecated and replaced by linux=
-firmware package.
>> > Do you confirm that?
>>
>> Generally speaking, new firmware that is used by drivers in the Linux
>> kernel would be added to the linux-firmware project under a license
>> that permits redistribution.
>>
>> The alsa-firmware package still exists for some old cards and that
>> firmware hasn't been migrated to the linux-firmware repo.
>>
>> > If yes, How can we push our firmwares files? Just by sending them to y=
ou?
>>
>> If they are net new firmware files, you can follow the README file for
>> the project to send new submissions:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.=
git/tree/README
>>
>> A pull request from a GitHub or Gitlab style git forge is also acceptabl=
e.
>>
>> josh
