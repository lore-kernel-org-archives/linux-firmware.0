Return-Path: <SRS0=Mqt6=7N=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731A8C6FD1D
	for <linux-firmware@archiver.kernel.org>; Tue, 21 Mar 2023 10:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4128FC4339B; Tue, 21 Mar 2023 10:32:00 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 514FEC433D2;
	Tue, 21 Mar 2023 10:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 514FEC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id x198so6733305ybe.9;
        Tue, 21 Mar 2023 03:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679394718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rGriZObZ7ZE2dtw9s8DCn2QVaFVEKb13HRyR9/7gvns=;
        b=l/lDMERfEBsIxY6lnU8/0TVJNDgB3Ukb2BrU+kaLoxHrRdNbcff3Wp2QKheUqThi6o
         99NGGLAFBHjQiYXo//QwrE9pWJ5kgpdVITXUcLOhABq6+RKxwscX1Pexccb35Sb36Zcg
         9epTS/5kZ6vIQRC+AGLd7oKI/OlZWp0GZ8lATTf8d0i/GhiuiHEE+SOwGyW6sPWiciqK
         O4mAooRnVlVgxN9SjM74EeamQAyKU3TMnUyU52CNAHZNAPdaEenEj/rfgAojm3dEZIOp
         w16/0b0QSYV6zUFu4bDG1ufHPzBDLUO+wJK8Mwq4L6q3iWLUkjmKQah5yeB6SO/HM06Y
         kDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679394718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rGriZObZ7ZE2dtw9s8DCn2QVaFVEKb13HRyR9/7gvns=;
        b=hfz6jk/HrJfYTvlflbmkOB8UkGUa8JDeR+VzWzZ+Qa+cxBIyWGqUE18ZZD4GiMV7Y0
         Kz0hJrsuxv9n8W0c7cYth9PYToyxq5un7KhLqufcD/kKKOFQCX5ELSZW9oyvamBSyXaC
         J57f4PngkjF3ZtXW42h13GRme9Mc2+CJ+9bhHarvj+4nsbqpahETbB1J9IoFTpJxv3IW
         /fCym0FJuE8s4kF/N9a+Uo19/p9k2FtQb5ZDhh6qcpBbhMivHLrNkLDlJr35CIWE17sq
         fMIN7BQQyysppjoFPo71GqvH5T+WnQ02XK10SzuOQmKD1TiQrWp1BfFnWzcEjYQ/55t3
         2gqQ==
X-Gm-Message-State: AAQBX9cdaAU3zh1IySpIsLVJrIi+fbru84WHPEZRP2PhvtNWTxGoqztL
	ETJj1kaHQrzUJDb6I7zneoZ5nlfJAJW5lubM/DH2Bicu
X-Google-Smtp-Source: AKy350bUjmaXVvRRnw1sy6GM7djlBR1Bc5knKAt67nkX4mstaYPoxbYDezX5Vlk4i1s/EPixO2Z0l8mJhHkAEtpjEbM=
X-Received: by 2002:a5b:8d:0:b0:a65:8cd3:fc4 with SMTP id b13-20020a5b008d000000b00a658cd30fc4mr1108008ybp.5.1679394718228;
 Tue, 21 Mar 2023 03:31:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
 <20230301-fixes-and-compression-v2-7-e2b71974e842@gmail.com> <CACvgo51S927dpSntF8Y4MmsOQGzw6P21mkdE2RP3n18+djfOEg@mail.gmail.com>
In-Reply-To: <CACvgo51S927dpSntF8Y4MmsOQGzw6P21mkdE2RP3n18+djfOEg@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 21 Mar 2023 10:31:47 +0000
Message-ID: <CACvgo50PM4ZhmjOrkCshyxjReSO00fZmjTGJ3hb6OfPEQ7J0dw@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 07/16] check_whence: error on directory listed
 as File
To: emil.l.velikov@gmail.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Josh Boyer <jwboyer@kernel.org>, 
	Adam Sampson <ats@offog.org>, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Mar 2023 at 20:24, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> On Wed, 1 Mar 2023 at 18:56, Emil Velikov via B4 Relay
> <devnull+emil.l.velikov.gmail.com@kernel.org> wrote:
> >
> > From: Emil Velikov <emil.l.velikov@gmail.com>
> >
> > No occurrences in-tree, but it makes sense to sanity check that.
> >
> > Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> > ---
> >  check_whence.py | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/check_whence.py b/check_whence.py
> > index 7ff21f6..130966e 100755
> > --- a/check_whence.py
> > +++ b/check_whence.py
> > @@ -47,6 +47,11 @@ def main():
> >      known_prefixes = set(name for name in whence_list if name.endswith('/'))
> >      git_files = set(list_git())
> >
> > +    for name in set(name for name in whence_files if name.endswith('/')):
> > +        sys.stderr.write('E: %s listed in WHENCE as File, but is directory\n' %
> > +                         name)
> > +        ret = 1
> > +
> >      for name in set(fw for fw in whence_files if whence_files.count(fw) > 1):
> >          sys.stderr.write('E: %s listed in WHENCE twice\n' % name)
> >          ret = 1
> >
> > --
> > 2.39.2
> >
>
> Josh, humble poke about the remainder of the series. Would you have
> any comments or suggestions?
> Note that many parts can be picked individually. Should there be any
> merge conflicts, those will be dead trivial to resolve.
>

Humble weekly ping?

Emil
