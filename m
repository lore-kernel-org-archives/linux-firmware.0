Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022B0C77B7F
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Jun 2025 13:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D184DC4CEF2; Mon, 23 Jun 2025 13:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB846C4CEF3
	for <linux-firmware@kernel.org>; Mon, 23 Jun 2025 13:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750686666;
	bh=C0xazmixmNnw5MZYOMjLpMAkzbEzjA4rgXTi0fHS8Co=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=HtqzOjSoLjOwNs0ucnPX+lSwlEbrVJW70SA6DRytSr0N0EBN+xvqhrw9pdPmbPdsf
	 5TyzeLbxvuCjPOwXATJTR9y2yLSyFi6omCicY+d4gj4qkxpR/sE4xzy0BG34tfuYdi
	 +Lh9G0NL2uIpkSathGEHhgDkM186zQus/hHbI1V+QEDfUPlGoAPIshtDnAhMFedifA
	 IeCed8qhn67ix6iGyLpdnQdujxBxQZe0Kw98BoR/4q1Iny+Ij5N2dmulF49hGmN7er
	 6EG1zFmAgVREd6FP421LjUUDBgYo2gTu00nDaneJ+5BJthyQOlmHqJi/DSVPa0kSCA
	 hil6/kuU7VDkw==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-70e75f30452so29587137b3.2
        for <linux-firmware@kernel.org>; Mon, 23 Jun 2025 06:51:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWUlSygxBMCYre4OO5OpLgm9tA4c+7PmR+MYf4duQezcP3U9FnBiEluFxv0t7xyA70ZorcSQya8cwZ/AnwaTw==@kernel.org
X-Gm-Message-State: AOJu0YzbmkbPT46Mw6wgXJbfzsDvwRmFamLQdP8XYjzdEaCpIgi2P3ke
	GCO2I6xPHG5mP76rN1YVB0MPbd5nhgf4ndIT0NqJygnHOVGawxFUtGqOysLyHTvH0Rz7LpLqDjn
	ToVAxKjjojLtgq7AQrb9hrv6eDlSFVng=
X-Google-Smtp-Source: AGHT+IHOtdJq0qsCSkpSmBjdqs6mcm+Q2wEJsIhAb8EwwMyPm3UrFuKSwBr56YcP/MsP2+/ejvitY9WHmuYIY/BlLwY=
X-Received: by 2002:a05:690c:a9a:b0:70b:6651:b3e2 with SMTP id
 00721157ae682-712c63b17f4mr188084527b3.6.1750686665991; Mon, 23 Jun 2025
 06:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250623115444.12870-1-slark.xiao@gmail.com> <xlredaznmv2li7vs4vi5dze65d5fhbff4tvvsjcraltmrs7jx7@vdj4n3u2zu5f>
In-Reply-To: <xlredaznmv2li7vs4vi5dze65d5fhbff4tvvsjcraltmrs7jx7@vdj4n3u2zu5f>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 23 Jun 2025 09:50:54 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5CuoMv3rTxb=StPWxf2T8KcQjvgJG_1duHG7f8gWuf6Q@mail.gmail.com>
X-Gm-Features: AX0GCFupPIC0NWqkO2mCyJDHYTK0bWWQ3zDUn94myOxMXU4-yEIUXAtB0Qt7EQQ
Message-ID: <CA+5PVA5CuoMv3rTxb=StPWxf2T8KcQjvgJG_1duHG7f8gWuf6Q@mail.gmail.com>
Subject: Re: [PATCH] qcom: Add sdx61 Foxconn vendor firmware image file
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Slark Xiao <slark.xiao@gmail.com>, linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 9:42=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Jun 23, 2025 at 07:54:44PM +0800, Slark Xiao wrote:
> > For MHI modems, it defines an edl firmware in kernel drivers/bus/
> > mhi/host/pci_generic.c file. According to the requirement of MHI
> > driver maintainer, we shall commit this firmware before commiting
> > kernel driver support.
> > Since different vendor use different firmwares, so we add a
> > vendor sub-folder under qcom/sdx61.
> >
> > Signed-off-by: Slark Xiao <slark.xiao@gmail.com>
> > ---
> >  WHENCE                                    |   7 +++++++
> >  qcom/sdx61/foxconn/prog_firehose_lite.elf | Bin 0 -> 663552 bytes
> >  2 files changed, 7 insertions(+)
> >  create mode 100644 qcom/sdx61/foxconn/prog_firehose_lite.elf
> >
>
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I'm sorry, but I have no indication the submitter has the authority to
submit this firmware.  It's from a gmail address.  Is your Ack
implying Qualcomm is agreeing to submit this firmware?

josh
