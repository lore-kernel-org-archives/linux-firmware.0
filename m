Return-Path: <SRS0=y5u9=67=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45ADEC678D5
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Mar 2023 20:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0AA33C433D2; Tue,  7 Mar 2023 20:57:23 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 27674C4339B;
	Tue,  7 Mar 2023 20:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 27674C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id c80so5769668ybf.5;
        Tue, 07 Mar 2023 12:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678222640;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EQUbXWLxu2zimrfS5qXD3SBaskB5pWQ0zH2DGd90xrs=;
        b=RI1jTj5k+fieW+0Jzw609ChvcDtJzP/oka+j6d9Ii8nVG5ES3qA010w0zBNgUSt4Zl
         tVVANrfOelVAa7yBcsne9THn2tCzs7j9+o28OVRnAycs4ynIvbkvguPqKhA9V99582Ej
         aRqetxGQDvqe6lQOj+92TgrFGLEyyBHg9YNwijXN2II6Ob34ApOy8m4/mKi1a/+I3xK2
         J4xR/tqN8nDdx5Cnev+X2Y5GKwUVMcYHRd34M7jP/c2P6vhGStwefcXBmZ+av0c9/54M
         6zquw6LlJUpWsJSnGwu1k16Kr0tjIStRA6jaMhWubVtK+V5SU5919NdROa6mD7psFzMW
         3CNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678222640;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQUbXWLxu2zimrfS5qXD3SBaskB5pWQ0zH2DGd90xrs=;
        b=VpejfmCVc7b2qGH4ivCLiLOyeO1cO49NS+sxIlU+oF+Nt9MXwOkrNKGsWwzl73O8cf
         EcNF2fgLh5SoFCS1KCgpXFw8TfvB6xWPKJQnWEdZKtTKYeYJCLdKn3c78efu888o9+pL
         7nHkXrKPvQlvQfnY65IJcG1eH6qHVImQjooroow/itdebqrtLer1/I/gx2pv1+Ma+8hS
         sPW1uaemMe0xTX/VBZLm5YNn+xLp2EmPP9IqNcFdyrL8NDka73ZUfod3E3/wemHbzLBE
         H+4y2pQCFDM0JKEtrBN1/VRGtonJczIJDfOTZnobdGo+/4fK3JB5/kwHyUk0AVo+Wrgi
         ncTw==
X-Gm-Message-State: AO0yUKVCPwLAoiTXOY4kS86j9MRc9QgK5QUVwP/+UMTIOc6DsqaNxG2N
	kAw+X6vzipCQZVPKWOUaVeb7WSYS4WlgxSum0LFMtpCG
X-Google-Smtp-Source: AK7set8Ofs2MrwEXZR1k2SsZ7C3MM/q0NOtx4yYKgYaXWlkzrQR6ZzxlwZ2PuqJ7Y5KoQV0Q0WyEdQP0xXmY875rmb8=
X-Received: by 2002:a25:928c:0:b0:a53:5825:f25b with SMTP id
 y12-20020a25928c000000b00a535825f25bmr9506458ybl.0.1678222640600; Tue, 07 Mar
 2023 12:57:20 -0800 (PST)
MIME-Version: 1.0
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
 <20230301-fixes-and-compression-v2-5-e2b71974e842@gmail.com>
 <CA+5PVA7eOJ+y2rdSyMAqVqqcp8w4oYfZU1J8PZV7+TKqDcxqbA@mail.gmail.com>
 <CACvgo51yMRXgbUfK6wNfDvXEuBXH=JPZhm9=oFkhFHipVqz5oQ@mail.gmail.com> <CA+5PVA4wGZxYjM7nVD7J4opM3fXwoK6oGW673=FBOzgeDMLwcw@mail.gmail.com>
In-Reply-To: <CA+5PVA4wGZxYjM7nVD7J4opM3fXwoK6oGW673=FBOzgeDMLwcw@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 7 Mar 2023 20:57:09 +0000
Message-ID: <CACvgo517Ld+e-AWqSkfzKtKBMfZcHHP50xU_WJJeqK9RefZ1kQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 05/16] WHENCE: comment out duplicate MediaTek firmware
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Adam Sampson <ats@offog.org>, 
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Mar 2023 at 18:08, Josh Boyer <jwboyer@kernel.org> wrote:
>

> I think this is a case where both should be listed.  If you comment
> one out and the other entry gets removed, perhaps because none of the
> upstream kernels support the driver any longer, then the installation
> will not copy the file to disk and the driver that is still in-tree
> will now have missing firmware.  I don't want to leave people without
> a functioning system just because we wanted to avoid some text in
> WHENCE.
>

That's a valid point, although I wonder if we have greater odds of
witnessing the sun turn into red giant :-P

Joking aside - I'll drop this patch and 6/16 while adding a "grep foo
| sort -u" patch for copy-firmware.sh. Barring any objections of
course.

Thanks
Emil
