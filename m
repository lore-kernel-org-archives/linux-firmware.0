Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81995C2D0CD
	for <linux-firmware@archiver.kernel.org>; Wed, 21 May 2025 15:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4D108C4CEE7; Wed, 21 May 2025 15:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3786CC4CEEB
	for <linux-firmware@kernel.org>; Wed, 21 May 2025 15:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747839970;
	bh=dD68mH2PuqACJjCKYCg3gijSjJuVF4dUddlWGjrIGJU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=LX+I0Dw2OQyZPEWSMgK6nzX0Senb+QMRSzSJCFrPmVdcpQBseqKK0D/euuSNoiKty
	 gzSIQcuDAoUbEi0THR7gPoMaVZi9tmpPbfZK02j2zGE9HzjGXaxHlWsujz/vlPdmaA
	 UbavXxUsugyfs+CvsWu2Ybm2hXoVNB+gPBWGoOkGlczhnP18myjlWkMJ88iEDVIOWH
	 jyDgqbzt779LatCS1buC+6IxDr6Bw0Vv1ZWY/DYMmB8b0GET2q+Ecuv3phmkUjnMyF
	 HX6QIsAQl4OAHWJNOxdltvKkLAnkL/IuI+451Gu+B+nxKyLShGtodrLCFnL/A22S+F
	 LzJ39J9Rh4Faw==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-70dec158cb7so16598137b3.2
        for <linux-firmware@kernel.org>; Wed, 21 May 2025 08:06:10 -0700 (PDT)
X-Gm-Message-State: AOJu0YywU+Fum1rZh1r7zMA0LkyAfhEYkwc4WcoT1vHiir/oOQysxCYY
	b90rx8QCD0x/nMUK4Vj20qxi4OV7E5CAshC9hcRIOPih7wFEPOm49ObHX2JVhbDXPQCvAgckuxG
	QwcA9C2qBIP+WfLQao0T9GEZn2f1h4X0=
X-Google-Smtp-Source: AGHT+IHbmwN7TIjqUj0MqEeo7fY7cG0AUM55P1mvPTP/IEkrYxooznD1hsuebxl+5AK4e323j+mi7VSx7cvPX6benDM=
X-Received: by 2002:a05:690c:3389:b0:703:b5ae:a3da with SMTP id
 00721157ae682-70ca7b8fd45mr326096287b3.32.1747839969342; Wed, 21 May 2025
 08:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <003601dbca5f$7d9f0900$78dd1b00$@opensource.cirrus.com>
In-Reply-To: <003601dbca5f$7d9f0900$78dd1b00$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 21 May 2025 11:05:58 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7pY2Ezj5v3vHDFk=zNxbuV0bCY8pW7djCB=arwPfBU=g@mail.gmail.com>
X-Gm-Features: AX0GCFtvDFcZWG6oEK5enEzoLp0o8Cl5sUZuIU7ju_UGiuK9iRvDe3CXvOCkaHs
Message-ID: <CA+5PVA7pY2Ezj5v3vHDFk=zNxbuV0bCY8pW7djCB=arwPfBU=g@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Fix firmware filenames for CS35L41 for
 several ASUS Laptops
To: "Stefan Binding (Opensource)" <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/558

josh

On Wed, May 21, 2025 at 10:49=E2=80=AFAM Stefan Binding (Opensource)
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to fix firmware filenames for Cirrus Logic Smart Amp CS35L4=
1 for several ASUS Laptops.
>
>
>
> Thanks,
>
>
>
> Stefan Binding
>
> The following changes since commit 341b9e805613d1b4137032b488eec4a941d181=
f6:
>
>   Merge branch 'robot/pr-0-1747749123' into 'main' (2025-05-20 13:55:16 +=
0000)
>
> are available in the Git repository at:
>
>   https://github.com/CirrusLogic/linux-firmware/ cs35l41-20250521
>
> for you to fetch changes up to 7966e448ac3b3fabeb9d3a2556a1544e312189d5:
>
>   cirrus: cs35l41: Fix firmware links for several ASUS laptops (2025-05-2=
1 15:42:12 +0100)
>
> ----------------------------------------------------------------
> Stefan Binding (1):
>       cirrus: cs35l41: Fix firmware links for several ASUS laptops
>
> WHENCE | 10 +++++-----
> 1 file changed, 5 insertions(+), 5 deletions(-)
>
>
