Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366E9C6FA99
	for <linux-firmware@archiver.kernel.org>; Fri, 10 Mar 2023 12:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1471EC433A0; Fri, 10 Mar 2023 12:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3033C4339E
	for <linux-firmware@kernel.org>; Fri, 10 Mar 2023 12:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678452145;
	bh=jl+xPzq68ZdeCNKc6AWpbf9eNkHGrQZJ3cK1OV4iIpc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Jhh5oKGmLa4Gw30/xDPtUkif0+swJVnJ+B3YeF8EVAGL8JHyK5h7KyzwUE1pEm6gU
	 BjhxWxH+uHdcLn+N4YjiOo5XkxGBUMJQCF8Y4wnlTeJD2kn1TtSpKDDU9P4DhZUVEk
	 tgNQrdw75/NdKYZrYekSZss4bClUe8l1ljeB4XvFuvuLQ5XSEeQLJA+wW0E2NLfvpE
	 Bo/bj+d+dXS2RyytgzSaBYZTV24ksOOz5MCwC3eG+7k7/7S8kNiUrCc5hs7LDsPMj/
	 wnOi3CWClBrnenHtQHykWmiQO8Wt4fGDOBCY5Vucpqo6VngKmuMFTUeIUoQ+90eCo4
	 UDnti9fiIWHTQ==
Received: by mail-yb1-f177.google.com with SMTP id t4so5082431ybg.11
        for <linux-firmware@kernel.org>; Fri, 10 Mar 2023 04:42:24 -0800 (PST)
X-Gm-Message-State: AO0yUKWcqjjx50TcAxOTYvCnWwIZ80u2T2X5PvTcCUnc6pwGCVrLMJMv
	9A/YKr1m/SJTQxpR9WdFronq8KYS2CwHqRVPw5c=
X-Google-Smtp-Source: AK7set8f/KEdC/z1KuM460zqnoePJbQo19ggHQD5TCcS1DyQhJTlL9ufV60dRqsYkx+XwdGUYdO7CK5sD9UNAiCBmHE=
X-Received: by 2002:a5b:c11:0:b0:acc:533b:9451 with SMTP id
 f17-20020a5b0c11000000b00acc533b9451mr15703088ybq.0.1678452144019; Fri, 10
 Mar 2023 04:42:24 -0800 (PST)
MIME-Version: 1.0
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
 <20230301-fixes-and-compression-v2-5-e2b71974e842@gmail.com>
 <CA+5PVA7eOJ+y2rdSyMAqVqqcp8w4oYfZU1J8PZV7+TKqDcxqbA@mail.gmail.com>
 <CACvgo51yMRXgbUfK6wNfDvXEuBXH=JPZhm9=oFkhFHipVqz5oQ@mail.gmail.com>
 <CA+5PVA4wGZxYjM7nVD7J4opM3fXwoK6oGW673=FBOzgeDMLwcw@mail.gmail.com> <CACvgo517Ld+e-AWqSkfzKtKBMfZcHHP50xU_WJJeqK9RefZ1kQ@mail.gmail.com>
In-Reply-To: <CACvgo517Ld+e-AWqSkfzKtKBMfZcHHP50xU_WJJeqK9RefZ1kQ@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 10 Mar 2023 07:42:13 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7MLRQwygXZbCscpJ=8hDnvQ6A4wOvNG-9zJO73+hXgAw@mail.gmail.com>
Message-ID: <CA+5PVA7MLRQwygXZbCscpJ=8hDnvQ6A4wOvNG-9zJO73+hXgAw@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 05/16] WHENCE: comment out duplicate MediaTek firmware
To: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Adam Sampson <ats@offog.org>, 
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 7, 2023 at 3:57=E2=80=AFPM Emil Velikov <emil.l.velikov@gmail.c=
om> wrote:
>
> On Tue, 7 Mar 2023 at 18:08, Josh Boyer <jwboyer@kernel.org> wrote:
> >
>
> > I think this is a case where both should be listed.  If you comment
> > one out and the other entry gets removed, perhaps because none of the
> > upstream kernels support the driver any longer, then the installation
> > will not copy the file to disk and the driver that is still in-tree
> > will now have missing firmware.  I don't want to leave people without
> > a functioning system just because we wanted to avoid some text in
> > WHENCE.
> >
>
> That's a valid point, although I wonder if we have greater odds of
> witnessing the sun turn into red giant :-P
>
> Joking aside - I'll drop this patch and 6/16 while adding a "grep foo
> | sort -u" patch for copy-firmware.sh. Barring any objections of
> course.

No objections.

josh
