Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B66C71135
	for <linux-firmware@archiver.kernel.org>; Fri, 13 Jun 2025 12:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CF594C4CEF1; Fri, 13 Jun 2025 12:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A58C4CEF0
	for <linux-firmware@kernel.org>; Fri, 13 Jun 2025 12:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749817992;
	bh=OfYOLezYA5KrPxS460Qn1vRG4QiPAdrILv+ENKqjm70=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ZWTHQgyi0f6aufozcBCfaQDxwe3U6+p1ND5JYOYOyHyfXmFOuD5HIrYwnDciTC52P
	 vtqvjybORD6fZzffTiw11ckBchKxMfhnVIqEHpG5os0rojvA7/98h4QPGxjPfYr6TY
	 uv80xVgCq996GyHJncNwmsOESnsD4jedwYgpxOYB0r4qDLJKIxz6he42IWL+Z7Y1cf
	 btY+h1+ZCfXSLXzDhjZeKShFQl29quz9oDaLLSS7Y5T2NlkDm89B8EFrXG0YJowdx+
	 8wwQV16LjKLH7k54/Xn0gAABnTkib6glTnfslsp+qaP47pz44TnMnOS11+g9pIoA7P
	 gI9Iw8QofzSTA==
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e81a6da56b2so1472118276.3
        for <linux-firmware@kernel.org>; Fri, 13 Jun 2025 05:33:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5iGE8rmWW7XiFrUrVKd0pK4NZhYEVnt6JOPKI0cVD5sOO729tyTSAMmNaL9iwMnT9dK21vf5k6rQh7gglrQ==@kernel.org
X-Gm-Message-State: AOJu0YxErKYDKhlPsh2srpQincWlV0YRs/iKamftUtRwPWYCUNL9uEtU
	S7A7S1j9j3N4sdvI2d0e6ZtiRiBBT5ufkwAj9IDsPGJgaDB1hdTG4a92GVPDvvnLZVUjmojg+nk
	JsAiPzkyzNtzsg1qTFTfE/Nvvlncxk+I=
X-Google-Smtp-Source: AGHT+IGjrpmGepzEdGxxVUVboCOCb9lPukk/AJAumctstTMCVrkHhvJfkqSW6b0Fh/GzvUAOmbonP2tLwDiwacznoHE=
X-Received: by 2002:a05:690c:67c7:b0:70c:b882:2e9 with SMTP id
 00721157ae682-7116360d4afmr43027577b3.3.1749817991927; Fri, 13 Jun 2025
 05:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <9fa3184b-991c-4dc5-a719-13de57ab44fa@oss.qualcomm.com> <nnqrkrqp5ig7nb5nw6nfxqqzsi234y3dvmzvjh5e7pzr2c2coc@y6e7ml24quep>
In-Reply-To: <nnqrkrqp5ig7nb5nw6nfxqqzsi234y3dvmzvjh5e7pzr2c2coc@y6e7ml24quep>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 13 Jun 2025 08:33:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7kXYqnQJ1+rgRwGa0RackBgwu-KE6aTqqb9=VxtaHv=g@mail.gmail.com>
X-Gm-Features: AX0GCFspbUa6yLmNbs5Efy6bUOUTkEujXBFUxyFN8uYyxEgtclAhPRqZFvmu158
Message-ID: <CA+5PVA7kXYqnQJ1+rgRwGa0RackBgwu-KE6aTqqb9=VxtaHv=g@mail.gmail.com>
Subject: Re: [GIT PULL] QCA: Update WCN785x btusb firmware to 2.0.0-00799-5
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Zijun Hu <zijun.hu@oss.qualcomm.com>, linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 6:20=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Jun 06, 2025 at 02:21:07PM +0800, Zijun Hu wrote:
> > Hi linux-firmware maintainers
> >
> > Here's a pull request for QCA bluetooth driver. Please let me know if
> > you have any problems.
> >
> > The following changes since commit 3b75d677f898fe2aacc7b11763bbcd4732e7=
1ce7:
> >
> >   Merge branch 'intel/update-guc-gsc' into 'main' (2025-06-03 21:03:19 =
+0000)
> >
> > are available in the git repository at:
> >
> >   https://github.com/zijun-hu/qca_btfw main

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/583

josh

> >
> > for you to fetch changes up to 57ed44c43b346ebba23afe1b4aac76ea1a4b8fa6=
:
> >
> >   QCA: Update WCN785x btusb firmware to 2.0.0-00799-5 (2025-06-06 13:33=
:46 +0800)
> >
> > ----------------------------------------------------------------
> > Zijun Hu (1):
> >       QCA: Update WCN785x btusb firmware to 2.0.0-00799-5
>
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> --
> With best wishes
> Dmitry
