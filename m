Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC123C678D5
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Mar 2023 14:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AFD19C433D2; Tue,  7 Mar 2023 14:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98FA1C4339B
	for <linux-firmware@kernel.org>; Tue,  7 Mar 2023 14:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678200477;
	bh=X83cGraeAbE/llZ6zYNNGi6fe5SCCFLv4O9zsGx55TM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=W1dmVlD28xTArD3JTk9dDlyfpo5fXOR6LjDzAOCAM1gRlXNtDRpCBxObHwrgOULyl
	 4W3P8TXEr9qTjgpBme1vFL/WP/Soic7bMczGnaCwb4jzuiQmiwc7YBZYs5XwFSmWkw
	 H95LnPqfJ4yhPuhYHir9GU7ZhU6AYpFYAlY4rU6K3tcwkahPyysxR4IpLRvMBElSHT
	 tOZXTCdRmErJzVepI5iwOoII8NO4NJgPP8udycHEPFoxbpy3pnmX2i7S1cMtpTNFuo
	 iZ0Q7x3618/nyLYisInkA5NfFyulod+RRQiV3PXexUKebt953SedrhUCCAcep9/0pa
	 Ro1+4Q6Jf5PLA==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-536bbe5f888so248557707b3.8
        for <linux-firmware@kernel.org>; Tue, 07 Mar 2023 06:47:57 -0800 (PST)
X-Gm-Message-State: AO0yUKWjx0FDAY0MniXMLp/AXVd3D4DOpkos9CF8vxToX1NnGOEBADSt
	EjReZPJmlaMXzBcMKmQ5iWFrSxIhS+jLGAr6Uwk=
X-Google-Smtp-Source: AK7set8Adcb49c2S490iDDCQoTmAeTQyI4vY60RTrXjK+/u5RzyinnF0hSf5iNjhhWkPFdnI7PviGX720ULpRrsfA5w=
X-Received: by 2002:a81:4521:0:b0:53c:70a4:bca2 with SMTP id
 s33-20020a814521000000b0053c70a4bca2mr9664372ywa.6.1678200476660; Tue, 07 Mar
 2023 06:47:56 -0800 (PST)
MIME-Version: 1.0
References: <CALFERdxXtfewr8yHekHjic3aAFq4UbRnjcZT=tqAxSkq5XU2YQ@mail.gmail.com>
In-Reply-To: <CALFERdxXtfewr8yHekHjic3aAFq4UbRnjcZT=tqAxSkq5XU2YQ@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 7 Mar 2023 09:47:45 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6GEuSnVsuPOp0f7rqP1YXNbOYp31AEL=ytj24fTY=imw@mail.gmail.com>
Message-ID: <CA+5PVA6GEuSnVsuPOp0f7rqP1YXNbOYp31AEL=ytj24fTY=imw@mail.gmail.com>
Subject: Re: Fixing symlinks of some intel firmware.
To: Sasa Ostrouska <casaxa@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The patch itself isn't in the correct format, but I've included a
commit that fixes the issue and credits you with reporting the
problem.

Thanks.

josh

On Sat, Mar 4, 2023 at 7:30=E2=80=AFPM Sasa Ostrouska <casaxa@gmail.com> wr=
ote:
>
> Hi, in the last few updates of linux-firmware I saw there are some
> wrong symlinks created
> since the parent directory name is also in the link section.
>
> The attached patch should fix the wrongly created symlinks.
>
> Please cc me as I am not subscribed on this mailing list.
>
> Rgds
> Sasa
