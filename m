Return-Path: <SRS0=qe99=T5=gmail.com=alexdeucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57597C433EF
	for <linux-firmware@archiver.kernel.org>; Fri, 18 Mar 2022 13:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 27AABC340EC; Fri, 18 Mar 2022 13:29:13 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9192DC340E8;
	Fri, 18 Mar 2022 13:29:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9192DC340E8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f53.google.com with SMTP id w3-20020a4ac183000000b0031d806bbd7eso10082362oop.13;
        Fri, 18 Mar 2022 06:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MFpRRDNUCHz9Zg42/Z3dh2qdGg9Fn9tWhTqnILj2et0=;
        b=KrB/ZgPcFee+KvOpnrVw+EKSaymRa0CilgUORuNfNak4JB+Z/NxHowxgS5ZYFpYYOe
         H/f7BrT7pLGVCMQSFhSVbavbh3jHPODVEkoKV1qtSAGdLfPKq5hWzhQjtM+Js7hK7Jz1
         2QhTdgQZmBPRDdOFpOkQ74gMugrR0Zg2ISmfXK8odED/x+R6CgEO+0N7hgXYI1MLQ+b3
         IHHjeNe1NqwWD1JmQFBxKPTa1/iSuLBqZAr5S8iIp5biNeLhJ4Z1yZ2LvSEtYxWAeaKJ
         Grylc42bkA1+O7QR24YpqApaGZgDcfrmSF4rKUYRKXoI0yulEu1olM9my/4fpfXfURXc
         ieIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MFpRRDNUCHz9Zg42/Z3dh2qdGg9Fn9tWhTqnILj2et0=;
        b=hYXV175dD1BEYFIzzVQSTwadkN1Vtedn/uEoHxyDXHZR8nVRsBhcQDagKDVUm7tbjz
         klmJgYGQxgCNdkcZ0ZzNgAQbtpNB2AB3e3nGFnc18ReHUSfQrZFxitUufUvvqk+G8V00
         KpCKgUBQiMbLuuFgKHx2QkmsAqSPKeIRyBKbL61IUPXbZo4cY8hy+MdV2nXvGHfAgMcx
         xCQw7jM5eEykIS2a2Ix96E1/VUCCJIr/wUgRhKarE55/CKEpTs0zmRsXswTd+cdPyAVi
         hiHR9mCYOmKlMOOGFxYgakdtM7CDRQ92yyjNub700FRRLuqeF7rZmEuLGZVSZ063QAko
         VW0A==
X-Gm-Message-State: AOAM532sAwWDnLwa8F2zyWnlCUzILZukcXkOoxEwPEpsvd4DuCRoG0kT
	vvgzy/iTatqNxW2N2yufa2x+uVbeflxQh5hqqzvx7U4n
X-Google-Smtp-Source: ABdhPJxe2CAAPDvmtrK/NRWDqWRmVD7hua8k7/CWSsD4kcjkMPQv3zn3zJS5BFxlar7FzhDamRNVM0/u8rjXtop15fE=
X-Received: by 2002:a05:6870:630c:b0:da:b3f:324d with SMTP id
 s12-20020a056870630c00b000da0b3f324dmr3672791oao.253.1647610151604; Fri, 18
 Mar 2022 06:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_NLrOb26ZFW8R3ZYuDEvUzHyLYmNTnSb9jgthBLHw80iA@mail.gmail.com>
 <CA+5PVA6Eiu48qzmoAtFjQyBc-wXbnjkDomFXnDgmSvUhE7fgSA@mail.gmail.com>
In-Reply-To: <CA+5PVA6Eiu48qzmoAtFjQyBc-wXbnjkDomFXnDgmSvUhE7fgSA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Mar 2022 09:29:00 -0400
Message-ID: <CADnq5_O8upWBRgtwn45uHgcteKvuysgAhqpBkAcrVXf6qxfaig@mail.gmail.com>
Subject: Re: Updated AMD GPU firmware
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Thanks!

On Fri, Mar 18, 2022 at 7:36 AM Josh Boyer <jwboyer@kernel.org> wrote:
>
> Both applied and pushed out.  Thanks.
>
> josh
>
> On Tue, Mar 15, 2022 at 1:24 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Updated AMD GPU firmware.  Please apply!
> >
> > Thanks,
> >
> > Alex
