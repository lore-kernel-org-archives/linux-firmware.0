Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF21CF9C69
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Sep 2024 12:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D1E65C4CEC7; Mon, 23 Sep 2024 12:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBFB7C4CECD
	for <linux-firmware@kernel.org>; Mon, 23 Sep 2024 12:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727094913;
	bh=gYUyS7Zy83sLVLJ406QnRTLkFwRG+iZlkfHOIRWCOpo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=r4G3YxSPPt276PjCoCMktxpVNx61DCRQIQad/XbE8nSSq2JlLMfaIFgyPOZ7aXjf9
	 gmyIiX7jFB97kIv5RJhyhij+JyHhnCdY1po8MLlae9VwkctaekWlVC7oAEfse9u7g4
	 NmSWeZnsb0j8RrTUEDDP91DulrgSM93j9CHsPPyKRQkkKGGTrO3oZUtDBRAhybJyQf
	 gOaBICUQ7KDzRmAnlCsIYJHWJpsKibitSQJkHDhGXmtPPSq3vLPW2cdo244tNnuS42
	 hr2x6E2bZwmBoRSt9rtPyTYUrz5z6AkuwvfhAFiEYgLAKlxLL684EXznFORE0l+X5B
	 nRvrrRSer8/nA==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6d6891012d5so32809707b3.2
        for <linux-firmware@kernel.org>; Mon, 23 Sep 2024 05:35:13 -0700 (PDT)
X-Gm-Message-State: AOJu0YxuOSEfl+9FEVoQej93fl5hNkKe2k6shozlmJnGHdzYz4akPmgX
	RPCT/LWNa8qUfocpKVh1yyo4QxU+A/V6gSlXYI+I7puU4Id99PMQgVX4j3mY0VhU2FrJUTfaFoS
	S9ptpx4cF3lk7XjdDRCQXlc4//bo=
X-Google-Smtp-Source: AGHT+IELMOj9emzteexxdV3fiRtRZPTcQ9NVan2r9uhwrNePXQXXSCv64Xfb9XnNJ09KH8N3H+9HvqjMIQ5J7d1dAL0=
X-Received: by 2002:a05:690c:338d:b0:6de:b23:f2a1 with SMTP id
 00721157ae682-6dff283be74mr91869217b3.15.1727094912977; Mon, 23 Sep 2024
 05:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <28a0ab5067a34a308c155f3ccc08790b@realtek.com>
In-Reply-To: <28a0ab5067a34a308c155f3ccc08790b@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 23 Sep 2024 08:35:02 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7aVsf3-Peqxk0+gg=GsYYNtoOXfHrVY5wx9yR06r3HWQ@mail.gmail.com>
Message-ID: <CA+5PVA7aVsf3-Peqxk0+gg=GsYYNtoOXfHrVY5wx9yR06r3HWQ@mail.gmail.com>
Subject: Re: pull request: rtw89: 8922a: add fw format-2 v0.35.42.1
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Timlee <timlee@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 3:34=E2=80=AFAM Ping-Ke Shih <pkshih@realtek.com> w=
rote:
>
> Hi,
>
> Add rtw89 driver firmware for RTL8922A that firmware version is 0.35.42.1=
.
>
> Thank you
> Ping-Ke
>
> ---
> The following changes since commit b9daf8c33f02650b79bd1c61d61d6b1fae470e=
8b:
>
>   Merge branch 'amd-staging' into 'main' (2024-09-12 16:05:08 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git tags/rtw-fw-2024-09-13

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/300

josh

>
> for you to fetch changes up to 5685e14f2a1cf8ce8ee2ab5883eb327c9c9c5d15:
>
>   rtw89: 8922a: add fw format-2 v0.35.42.1 (2024-09-13 15:28:58 +0800)
>
> ----------------------------------------------------------------
> Chin-Yen Lee (1):
>       rtw89: 8922a: add fw format-2 v0.35.42.1
>
>  WHENCE                  |   1 +
>  rtw89/rtw8922a_fw-2.bin | Bin 0 -> 1586954 bytes
>  2 files changed, 1 insertion(+)
>  create mode 100644 rtw89/rtw8922a_fw-2.bin
>
