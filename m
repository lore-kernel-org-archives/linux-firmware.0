Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4744CC52D7C
	for <linux-firmware@archiver.kernel.org>; Fri, 23 Aug 2024 11:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1CBE8C4AF0F; Fri, 23 Aug 2024 11:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060C8C32786;
	Fri, 23 Aug 2024 11:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724412363;
	bh=cQW6gIzgs+CeDYrDoFOi4ZisRHPzYPlTLhFkaakH6Zw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=aYQGJPMYJhVNkOWdaQt66/ftfnqIqnUYGpM8ZddD0/Ap4IgbWQVfdazfragZFnrod
	 7UYmexEKda5lJA1E1YBDr5XOq3z6IuKKDREgQsDuJR70onQ0MJEv0DB6VoILuzblTX
	 0Kss9N21DF7cbGbzDR3KZlHbYOH/7ZdfYLPmE2C2Zq+E/Qy2xPEBRMCP7WrHC6/yG6
	 AjQUFHk5EZD3BzsbO6WdBx9yidfwh2ePLmBzpRD/5/5HSQSQUCsZwv65pQkXmgqwM0
	 yD0Tk1LKxgZ6ZHoMDNL8Jjunfg594ssKdCuqeBtZlZ0ljRwIEY+lKEEBAavCbKPHzu
	 pDq8XtTAEcgmw==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6b6b9867f81so16423287b3.1;
        Fri, 23 Aug 2024 04:26:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKFfMmhPmhOZt7RkGF3aVya44u2omUFV6HYPJtvQ8a/2lNkEEMVU8MdVkQZdOsrLKdejWzRv4=@kernel.org, AJvYcCVFURcqA785dVEBrIQOHU/bRtuXYnKeU8tuqhVXA2//D9m6lyk1iVvbkLbUicKVl2XylDHEdOKGoQz52pBguQ==@kernel.org
X-Gm-Message-State: AOJu0YyBlRBTIIlybYB3cFYVP5JhDQHKNPiByApbTfHmBIoNYgm724Vx
	TmvqI2sSGYvFoXiegApCBUI5GDXT+qGzCDqJXsvOUADWhULgJyhL6M/J6GZiGVpkBl+wZfiiCKs
	9Nx6r2B4ClpggTuHnZrGB3Hey2m0=
X-Google-Smtp-Source: AGHT+IFHznpOPNAj2zMvvHXZ90TgWM9PTPWCtpyFVTzZHZ3xOCnxB3eR9yuIWmQ6JYSXn9BFhGwB+60kBxB58mReW20=
X-Received: by 2002:a05:690c:74c1:b0:6b0:4f2b:29f0 with SMTP id
 00721157ae682-6c628a9f15amr22872447b3.29.1724412362234; Fri, 23 Aug 2024
 04:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <mbtpgfzqs5fud7pfrqi6wrzxg5eo47iet5sntdclwdzwo7zzhi@wtn4b55gpcp2> <2024082340-ream-crumpled-9434@gregkh>
In-Reply-To: <2024082340-ream-crumpled-9434@gregkh>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 23 Aug 2024 07:25:50 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6nFH36mpLGXMNzmxR5sQpT0fDFg5u6-t6tXNBaUJKabw@mail.gmail.com>
Message-ID: <CA+5PVA6nFH36mpLGXMNzmxR5sQpT0fDFg5u6-t6tXNBaUJKabw@mail.gmail.com>
Subject: Re: question about Renesas USB3 host controller firmware license
To: Greg KH <gregkh@linuxfoundation.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, linux-firmware@kernel.org, 
	Vinod Koul <vkoul@kernel.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 5:25=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Fri, Aug 23, 2024 at 10:14:18AM +0200, Marek Beh=C3=BAn wrote:
> > Can someone who understands legal mojo determine whether it is possible
> > to add this firmware to linux-firmware?
>
> Please ask legal questions to lawyers, not kernel developers.  Would you
> ask medical questions to kernel developers?  :)
>
> Why not just contact the company themselves and ask if this is
> acceptable or not?

Agree with Greg here.  It's best to ask Renesas and have someone
submit it to the linux-firmware repo with their Signed-off-by.

josh
