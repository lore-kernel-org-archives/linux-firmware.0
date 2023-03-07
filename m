Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420B3C678D5
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Mar 2023 18:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F023EC433AA; Tue,  7 Mar 2023 18:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB05FC4339C
	for <linux-firmware@kernel.org>; Tue,  7 Mar 2023 18:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678212127;
	bh=4iVFk8wyyEAgptxy06dS9KcuO2SFLh5icgtx7YRlsJQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=HbQicpOVnC3vyN4Q4u4RmaVudbFXCQc+p9wE9pdd7qZJaVuF9l1xXJ5gj/3AIneUv
	 ZgJ08XH98Bry2l+zdnhh6LbmTXrncceKRl5fgoQ9SlYRndOFJZFv8qr93e9JQijyw0
	 09qwF6VRL3vj4h9aRDQLCc0/HhsA5e92FpV4OYTsLaAhoe+tKEqBMRHLa9RvpGChzi
	 cg5VfQriKte7ntRST0fwfqjJFP8WkNUAMKzkH5vgFbINXHazYW/DKwtumzxF4usLL7
	 p0ArxCxRH8+sICI9l6EN8psgEhEPYqY3c1UY1lz7k8c+LQIwPwjXY4i19cv9WZJY0d
	 PhU3LMi+EooAA==
Received: by mail-yb1-f180.google.com with SMTP id e194so12301464ybf.1
        for <linux-firmware@kernel.org>; Tue, 07 Mar 2023 10:02:07 -0800 (PST)
X-Gm-Message-State: AO0yUKWRkPOZ/EcwZ2m2etrynUzbEJLH5h+ocBNW1tkyAttKXG3cnAAp
	5zs17UURoU2eHpsvU/M4clDMk71l2PW8392R1SQ=
X-Google-Smtp-Source: AK7set+Lvh6YUsOA6AiSowKPEopGnqPmGoU91VR7b8jmwC9AOT4KZHSaPpF1rPc/6T7E0ualneQ/0AMXuE8d/SNZDjo=
X-Received: by 2002:a25:9c46:0:b0:a5d:3d45:26c with SMTP id
 x6-20020a259c46000000b00a5d3d45026cmr9319902ybo.0.1678212126968; Tue, 07 Mar
 2023 10:02:06 -0800 (PST)
MIME-Version: 1.0
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
 <20230301-fixes-and-compression-v2-2-e2b71974e842@gmail.com>
 <CA+5PVA4iTX11n044dGRgu-3uE-JncTRoYWmu0nd2p=isfcpYug@mail.gmail.com> <CACvgo53NdnHhmQ4C7ObG_NcX2PyDwo=kFACstWgc4XCsp=Uw1w@mail.gmail.com>
In-Reply-To: <CACvgo53NdnHhmQ4C7ObG_NcX2PyDwo=kFACstWgc4XCsp=Uw1w@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 7 Mar 2023 13:01:56 -0500
X-Gmail-Original-Message-ID: <CA+5PVA51ZENWThuuwH1u3ZkrhaZ2b9ZtFEArAvTQxiee2J_VkQ@mail.gmail.com>
Message-ID: <CA+5PVA51ZENWThuuwH1u3ZkrhaZ2b9ZtFEArAvTQxiee2J_VkQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 02/16] WHENCE: remove unnecessary filename quotation
To: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Adam Sampson <ats@offog.org>, 
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 7, 2023 at 12:54=E2=80=AFPM Emil Velikov <emil.l.velikov@gmail.=
com> wrote:
>
> On Tue, 7 Mar 2023 at 14:56, Josh Boyer <jwboyer@kernel.org> wrote:
> >
> > This one no longer applies.  While the quotes might be unnecessary,
> > they also don't hurt.
> >
>
> Yup, it's understandable. I might have written/sent the series a
> couple of weeks ago. Cough cough wink wink :-P

Yes, I'm aware.

> I've dropped the quotation marks for consistency's sake - it's hard to
> argue for dozens of cases out of ~2500 instances in-tree.
> It will also make the sanity checks (latter part of the series) a bit
> more hairy but it's manageable.
>
> Do you agree with my sentiment - be that here or in the other email?
> Unfortunately, I'm not the one to get subtle hints over email.
>
> If you have concrete preferences - please voice them clearly. I'm
> happy to redo the series.
> Speaking of which: did you run out of time, or these comments are
> blocking the rest of it?

Still working through things.

josh
