Return-Path: <SRS0=y5u9=67=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A61C678DB
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Mar 2023 17:54:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B5449C433A0; Tue,  7 Mar 2023 17:54:06 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C30E3C4339B;
	Tue,  7 Mar 2023 17:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C30E3C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id e194so12274559ybf.1;
        Tue, 07 Mar 2023 09:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678211644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fb4N4frW7mcU8adfBmw1weiliplvp5HlaLgC7f/yEiE=;
        b=MCANdQT9cPK+DJMUs1vWzXEztIspxxpO7QSGdtLHm+uB7Qqu7Kz1KYv0p393hOwN6l
         +V2BfBB8cuIiQgqREkwookhYcQMHotd0AvDJKCqX9LFyLXq+tEn2RHu9d5XhMC83PG0p
         HXJxAVoFZwjdK0RBrJ07Z+GDYMJcqk8hlXU0jgMwXL04SpI7lJJ0FYuwJ20DACnBCO3Z
         9wmGOAezRcgp+S8NUsgRWVCdpz7M0vulroFrEpa9BDVax7BsIjiErLLIEvh9PnsZFTyH
         lz4CIVXkM0yya/Z4X8IF+7tO6+6PqehA6rnVn7++Mp5o/N05DtubwTeANp1wX55OErgX
         zZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678211644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fb4N4frW7mcU8adfBmw1weiliplvp5HlaLgC7f/yEiE=;
        b=3rto45kSv80xJAJr4unIz5bNwE178M87bVI4uY1atpd4BeOuUePmOd0jlMAP0Wnj+S
         jRkR96B7bg8lVkEFoBiIyGTSGFXLC3xhhLaAuzHaXY5X/98oZYihk61be/WrZ0JaU/Ab
         u/E4g5yLGlbD6l6Di4N4Qseasctel+AmaPZVi5dPPYa92xhvgbjhB3+c4jeHOhQer/ID
         b30TH+G/cMhlo4I4VQjdzXGf687dx04Z7cOdpGDEauHGD7cWV0pIoI1pana7cPQLIpX7
         6C4pOxm/b62v80wZuK6QsPxo2CZ1EYF5pSkdBEUZdV1z86ezwDQuvujXoYciO/Tp0ysf
         d+MQ==
X-Gm-Message-State: AO0yUKXXhFlkuw4O6PEJjW4i7sjjfbZ23wYGNbfQHNo64x+eANrZK4gq
	NPmgnJMxNq07rrFvVaMX1SgXDL9Mojoe/2aSzqi2y8HU
X-Google-Smtp-Source: AK7set8f0Bmp06L8wtjtbeNxZ/g8fxB596X3Af6Gtj2OOYC6t/cUexCWukVGmk9OhJKdZHcKRpForb/TWih1xkh6bZE=
X-Received: by 2002:a5b:b51:0:b0:a20:11a9:bd4a with SMTP id
 b17-20020a5b0b51000000b00a2011a9bd4amr7443251ybr.0.1678211644357; Tue, 07 Mar
 2023 09:54:04 -0800 (PST)
MIME-Version: 1.0
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
 <20230301-fixes-and-compression-v2-2-e2b71974e842@gmail.com> <CA+5PVA4iTX11n044dGRgu-3uE-JncTRoYWmu0nd2p=isfcpYug@mail.gmail.com>
In-Reply-To: <CA+5PVA4iTX11n044dGRgu-3uE-JncTRoYWmu0nd2p=isfcpYug@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 7 Mar 2023 17:53:52 +0000
Message-ID: <CACvgo53NdnHhmQ4C7ObG_NcX2PyDwo=kFACstWgc4XCsp=Uw1w@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 02/16] WHENCE: remove unnecessary filename quotation
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Adam Sampson <ats@offog.org>, 
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Mar 2023 at 14:56, Josh Boyer <jwboyer@kernel.org> wrote:
>
> This one no longer applies.  While the quotes might be unnecessary,
> they also don't hurt.
>

Yup, it's understandable. I might have written/sent the series a
couple of weeks ago. Cough cough wink wink :-P

I've dropped the quotation marks for consistency's sake - it's hard to
argue for dozens of cases out of ~2500 instances in-tree.
It will also make the sanity checks (latter part of the series) a bit
more hairy but it's manageable.

Do you agree with my sentiment - be that here or in the other email?
Unfortunately, I'm not the one to get subtle hints over email.

If you have concrete preferences - please voice them clearly. I'm
happy to redo the series.
Speaking of which: did you run out of time, or these comments are
blocking the rest of it?

Thanks again,
Emil
