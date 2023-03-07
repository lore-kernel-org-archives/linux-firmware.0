Return-Path: <SRS0=qKkS=67=gmail.com=casaxa@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CEFC74A4B
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Mar 2023 21:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E748AC4339B; Tue,  7 Mar 2023 21:32:38 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BCF47C433A0;
	Tue,  7 Mar 2023 21:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BCF47C433A0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f176.google.com with SMTP id bh20so10719237oib.9;
        Tue, 07 Mar 2023 13:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678224757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0m08wqmT44e7hhhpwEEuASuGQPnWzLwq3UG8TiLaHk=;
        b=nNyKpuFHwEwCjshZvPXfmRJK2AVqvZbIDAfBrrqGdZchkxZMSEigpZZO47mkvX3Ehq
         yGBWs47655kdhG7WdFNMlWjcCoTVbgFDduQ4Co4RglBbc8sMJQlFRhPN6DxJ4Pb67X8f
         nWUe4hv82HdPZqZ1PDPbtZ0pTW7yaap0Q7yNiEmEINIQ9NdkHicSEScBNf3e7szjwN07
         nDz/D1c39jdlLHwQb3nf9EEGYGEKdWVEd/RWlzaNjTEGR5RONNGbgzfrGpklnnTnjz1X
         IvXYvHnqwcKNhbDbQSJlu39poyB564yonluBjABQxaP7cKRxsjRpQRUDr+f1ZG1HXiPq
         ZCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678224757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0m08wqmT44e7hhhpwEEuASuGQPnWzLwq3UG8TiLaHk=;
        b=OLb5/K6Pv61XLVOnEkthyenrw3Wp9++jGP6kdUFqH0tY3oapm5EJrToFCo38yo0h2D
         3BrgpCjD2J+oVr259+i0JkKb0GPTa9HJumf9k/uHanFecm6EDhkLvz/6MPLKa7Aawikn
         cdzOpvnog6PiPgOd2+U3o2IHDdYcMn1fkv0XTLocPTcc3qDNZYpEvv+6WoYE5zqTuv4A
         vOqoyKbTmiHADga1+7UxmLGDarZEGnVl9HzMt807POp1TAF1UqMhUcls1Lr4TqM5vGuh
         XD0+MB8sNCFHdgmRLsf6XJAavwb9qysuQPKoEszh1Q7f9ltFSXopfb5Ln4kwUTW+E4Ez
         b9pg==
X-Gm-Message-State: AO0yUKXhZags4EdOMIFmoXtiQaH9tj0+nvsPcLcAkNdR9ptYQFwF6D01
	dQ7/HcksGvm4MaVTyoEs+Z1i7M6HuWwFapjEGhknEoch
X-Google-Smtp-Source: AK7set8EwtPOtu0GoM9/Aqjd9m6NQXXcjhPYV7XHzZm7863Eh98ssXgEaFZLhgyQeRHc7ZwjAB3F7s+etxdUDJCfKRk=
X-Received: by 2002:a05:6808:292:b0:384:df2:4b50 with SMTP id
 z18-20020a056808029200b003840df24b50mr5165260oic.0.1678224756803; Tue, 07 Mar
 2023 13:32:36 -0800 (PST)
MIME-Version: 1.0
References: <CALFERdxXtfewr8yHekHjic3aAFq4UbRnjcZT=tqAxSkq5XU2YQ@mail.gmail.com>
 <CA+5PVA6GEuSnVsuPOp0f7rqP1YXNbOYp31AEL=ytj24fTY=imw@mail.gmail.com>
In-Reply-To: <CA+5PVA6GEuSnVsuPOp0f7rqP1YXNbOYp31AEL=ytj24fTY=imw@mail.gmail.com>
From: Sasa Ostrouska <casaxa@gmail.com>
Date: Tue, 7 Mar 2023 22:32:25 +0100
Message-ID: <CALFERdzJ3Jo2xZWMBvmvDBCY9AYQCTXVXF-cWG6FGmequ3gh5g@mail.gmail.com>
Subject: Re: Fixing symlinks of some intel firmware.
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 7, 2023 at 3:47=E2=80=AFPM Josh Boyer <jwboyer@kernel.org> wrot=
e:
>
> The patch itself isn't in the correct format, but I've included a
> commit that fixes the issue and credits you with reporting the
> problem.
>
> Thanks.
>
> josh

Dear Josh, many thanks for applying the patch. I will try to learn
better how to create a correct patch for the future.
Important is it is fixed now :) thanks again.

Rgds
Sasa
>
> On Sat, Mar 4, 2023 at 7:30=E2=80=AFPM Sasa Ostrouska <casaxa@gmail.com> =
wrote:
> >
> > Hi, in the last few updates of linux-firmware I saw there are some
> > wrong symlinks created
> > since the parent directory name is also in the link section.
> >
> > The attached patch should fix the wrongly created symlinks.
> >
> > Please cc me as I am not subscribed on this mailing list.
> >
> > Rgds
> > Sasa
