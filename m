Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2206C00140
	for <linux-firmware@archiver.kernel.org>; Mon, 15 Aug 2022 12:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 67A7FC433C1; Mon, 15 Aug 2022 12:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52244C433D6
	for <linux-firmware@kernel.org>; Mon, 15 Aug 2022 12:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660568128;
	bh=my/7x34XgCbJZn338LHjCfW2he/bTb1lZIRjSMX+Fsc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ZUpYYnoDFKE+Q4B6TYa9iw62vKDxnPekkw1y5oVimJVoTKY8/CwCwrzwnLnAWvmkC
	 A3iucJ7ehf1Fr8iIcoRfDpPvUMnY6st/taTT9+85s7infDT1TCAatiuL+hWFSRF6KY
	 3n5B2W4SkL68Lwn7riNRoPVmHwgqPYeHOH8wtPgPr8cRr/1+0nbzDML94sOcsVy1Xk
	 sOZlRpoulrI7GQ1KgxCJemRqq9Hn5FvTwPIOaW7jjSRx6VNG7+FW+/gezfH7AneOKi
	 Ezwsouc6P/CGDBZmMF8mWq0zWiTdh44fFqSVvQ4nok9gc5ZxZ8JZRugl+gyaZQWPGO
	 bNITsAz3IpjjA==
Received: by mail-il1-f177.google.com with SMTP id x2so3742567ilp.10
        for <linux-firmware@kernel.org>; Mon, 15 Aug 2022 05:55:28 -0700 (PDT)
X-Gm-Message-State: ACgBeo1Un9ZbwX/CFPM8UJfoPewiXyGeOefD/D4i1YeZrB5Pq9LA8nhb
	TfULcI7kmYf01d5SdTFEpdPAQlDtql+VcpBufSI=
X-Google-Smtp-Source: AA6agR6LW7iaM7aemoLZ4Q84kSXqkA62HbOyodjtStC3W3pI1/dBJZk0UjGsLJbjs66WOY5Pwkb88vBntDYBuEBsPn8=
X-Received: by 2002:a92:d70f:0:b0:2e1:5734:d586 with SMTP id
 m15-20020a92d70f000000b002e15734d586mr7064261iln.251.1660568127432; Mon, 15
 Aug 2022 05:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <DM5PR02MB3686017F1E5D47CDE88F9BE2ED649@DM5PR02MB3686.namprd02.prod.outlook.com>
 <DM5PR02MB3686865C387271B9EA8143D8ED689@DM5PR02MB3686.namprd02.prod.outlook.com>
In-Reply-To: <DM5PR02MB3686865C387271B9EA8143D8ED689@DM5PR02MB3686.namprd02.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 15 Aug 2022 08:55:16 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4O+xVuGC1phdRjZvM_AekeCYatMZCnYBMASZs+BrbtqA@mail.gmail.com>
Message-ID: <CA+5PVA4O+xVuGC1phdRjZvM_AekeCYatMZCnYBMASZs+BrbtqA@mail.gmail.com>
Subject: Re: btqca firmware 20220811
To: "Tim Jiang (QUIC)" <quic_tjiang@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 15, 2022 at 4:04 AM Tim Jiang (QUIC)
<quic_tjiang@quicinc.com> wrote:
>
> Linux-firmware maintainers:
>
>   Any update on this ? thank you.

Pulled and pushed out.

josh

>
>
>
> Regards.
>
> Tim
>
>
>
>
>
> From: Tim Jiang
> Sent: Thursday, August 11, 2022 9:26 PM
> To: linux-firmware@kernel.org
> Subject: btqca firmware 20220811
>
>
>
> Hi linux-firmware maintainers,
>
>
>
> Here's a pull request for btqca bluetooth driver. Please let me know if you have any problems.
>
>
>
> The following changes since commit
>
> ad5ae82019480dc1feffb538c118397a40934e62:
>
>
>
>    Merge branch 'main' of https://github.com/suraj714/BT-Upstream
>
>
>
> are available in the Git repository at:
>
>
>
>    https://github.com/tjiang123/qca-btfw1
>
>
>
> for you to fetch changes up to 1ee415b64dc6a057d1c8e82a8fa4236198e0d00e:
>
> ----------------------------------------------------------------
>
>         QCA: Update Bluetooth WCN685x 2.1 firmware to 2.1.0-00438
