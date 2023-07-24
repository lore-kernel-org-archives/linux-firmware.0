Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943ECC0015E
	for <linux-firmware@archiver.kernel.org>; Mon, 24 Jul 2023 12:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 787C1C433C9; Mon, 24 Jul 2023 12:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C907C433C8
	for <linux-firmware@kernel.org>; Mon, 24 Jul 2023 12:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690201564;
	bh=cMDbrBkrM82aSx6G735bqszKONjcThjLquiEHr7Xpr0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=bCydXXVgeZOYaF3G2qgNhDyJlKZEKGG29OQ2cQSv0T+/0Qc+UToaVAJtEVLucJZ3e
	 8kkUnfWmXHFkrlTY/9yjge62NbN8ch3LC6DVv5kPq5cok84vNZT49V3xdQ3CM2tPdh
	 Fh26DVkoav2EuXhD0wyE1feBybj8JaotwNcjUBqZtF28dI3FmVj/mWJhzne+f4HEoH
	 OTaRMZEjAHo2YmwA1vhEa2sp9AyxOMdiq/y9K6QvaVyI1P5+vQ6hZHkVnEoQUWypiQ
	 KYGfa1oWv5vHvjP/m4KLLc9tXCvLaqo+x9whdD2GwGcwg6vqg53DfKiMOKStd/eZvH
	 O3AZvokhRBSnA==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-579de633419so46956667b3.3
        for <linux-firmware@kernel.org>; Mon, 24 Jul 2023 05:26:04 -0700 (PDT)
X-Gm-Message-State: ABy/qLYRhkSHLFZFd9kDUMRBcsrTUzZdGs09fJCSGjBWw7NbjY6jnkWi
	MBqIwqkDY5kLNxjjvfwFu2Gg50IV/7oMeeEiKas=
X-Google-Smtp-Source: APBJJlHXNjPmXgLoXAYL59SjXpRYjQ6n952baEtVzcE8tOenjMXYYbU7E8QK+LnLscOPPAPIEYToHKsGYMX/hcW7aq8=
X-Received: by 2002:a25:38c:0:b0:d08:1635:e16a with SMTP id
 134-20020a25038c000000b00d081635e16amr4125501ybd.14.1690201563375; Mon, 24
 Jul 2023 05:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <SN1PR12MB2445A26E0DD33B317B1152D3F535A@SN1PR12MB2445.namprd12.prod.outlook.com>
In-Reply-To: <SN1PR12MB2445A26E0DD33B317B1152D3F535A@SN1PR12MB2445.namprd12.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 24 Jul 2023 08:25:52 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6882BBjA8d78Uai826m8qdbAaN-aKHUAfmQH-H7iQD-Q@mail.gmail.com>
Message-ID: <CA+5PVA6882BBjA8d78Uai826m8qdbAaN-aKHUAfmQH-H7iQD-Q@mail.gmail.com>
Subject: Re: Updated amdgpu DMCUB firmware v0.0.175.0
To: "Liu, HaoPing (Alan)" <HaoPing.Liu@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"Deucher, Alexander" <Alexander.Deucher@amd.com>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>, "Sharma, Deepak" <Deepak.Sharma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied and pushed out.

josh

On Sat, Jul 15, 2023 at 1:33=E2=80=AFAM Liu, HaoPing (Alan) <HaoPing.Liu@am=
d.com> wrote:
>
> [AMD Official Use Only - General]
>
>
> Hi Josh,
>
>
>
> Updated amdgpu DMCUB firmware for various display IPs.
>
> Please apply. Thank you.
>
>
>
> Firmware release v0.0.175.0
>
> Tested with DC v3.2.243
>
>
>
> Best Regards,
>
> Alan
>
>
