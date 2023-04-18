Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67130C6FD18
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Apr 2023 12:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 353D5C433EF; Tue, 18 Apr 2023 12:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A562C433D2
	for <linux-firmware@kernel.org>; Tue, 18 Apr 2023 12:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681819453;
	bh=rEts7p1e3a3K+m2Mib8GtT2/tg9YmoI4S3JWIq86IE0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=rdf6KEV53SgVsIL4AmCCijwj2saGyVySlbpTm5g8wb+xWpVA70c89SJ5JFRVNtcr4
	 Xymrzf2EgEuJceE3xOVU1ZxBs29deOweFbOObrv/9rjhgJI0zHKJ6tt9hhQzmxuo7+
	 UaI2IStkbbqFdoY/nvPObb0eFM+m7TibniL/pKQrdyyK+6py3EJolvY6OUBXjhSQLn
	 ccTu+q4khS/hiU87deCrQ7q2oDEvD1rdNIMFTJwVYDBpijRLybZfZlQ5SDHvkeX9oe
	 EjcwhnbGOOdwfa/nHXIIl14fNT3FBE6aT7ek17tkNqpGFrWI8V35Vmo88YiQIu9Xqt
	 MSaEUvgtW5vzA==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-54ee0b73e08so456960537b3.0
        for <linux-firmware@kernel.org>; Tue, 18 Apr 2023 05:04:13 -0700 (PDT)
X-Gm-Message-State: AAQBX9eJ23jY+DvOb7RYrh2Y7xlOrFBPonTZXMeg79fRcmbo++rjqf6r
	i1cqwSnlzF679PydlyzbshNNqXCaACAZbIHnAtg=
X-Google-Smtp-Source: AKy350ZfT8wWwH9xctzxyrs5SX/JpTLoCSr6kO+XSH+CuMhE2mWzYGEcvOnf5NxvOcQpepdx7MDDvDtSAxHJ39hWMSU=
X-Received: by 2002:a0d:fc81:0:b0:552:b9ad:f2e4 with SMTP id
 m123-20020a0dfc81000000b00552b9adf2e4mr10555859ywf.51.1681819450245; Tue, 18
 Apr 2023 05:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <cff63468-447a-fcd5-ec9b-249a5b37e1da@opensource.cirrus.com>
In-Reply-To: <cff63468-447a-fcd5-ec9b-249a5b37e1da@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 18 Apr 2023 08:03:59 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5cM4As-Bjm8SjnQ7E0vcvQ0HJu3s7S2dpd-gxyh0emUQ@mail.gmail.com>
Message-ID: <CA+5PVA5cM4As-Bjm8SjnQ7E0vcvQ0HJu3s7S2dpd-gxyh0emUQ@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp
 CS35L41 for Lenovo Z13/Z16 Gen2
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 12, 2023 at 12:11=E2=80=AFPM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to add firmware files to support Cirrus Logic Smart Amp
> CS35L41 for Lenovo Laptops Z13/Z16 Gen2.
>
> Thanks,
>
> Stefan Binding
>
> The following changes since commit 86da2ac9b4e57e9a88f8bfcb5a163a406f5c00=
e1:
>
>    Merge https://github.com/pkshih/linux-firmware (2023-04-06 07:30:31
> -0400)
>
> are available in the Git repository at:
>
>    https://github.com/CirrusLogic/linux-firmware.git for-upstream

Pulled and pushed out.

josh

>
> for you to fetch changes up to 74afc00db84cb49768a057720c8595c04786ed20:
>
>    linux-firmware: Add firmware for Cirrus CS35L41 on Lenovo Laptops
> (2023-04-12 16:45:03 +0100)
>
> ----------------------------------------------------------------
> Stefan Binding (1):
>        linux-firmware: Add firmware for Cirrus CS35L41 on Lenovo Laptops
>
>   WHENCE | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
