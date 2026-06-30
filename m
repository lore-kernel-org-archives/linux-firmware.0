Return-Path: <SRS0=HM5Y=E2=gmail.com=akiyelejohn@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA18FC43327
	for <linux-firmware@archiver.kernel.org>; Tue, 30 Jun 2026 02:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9454F1F000E9; Tue, 30 Jun 2026 02:33:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1782786830;
	b=P5hEZA4whnds16xtlyJCzR7kt2hqDNFLONR9cISvN4qV2fMiP9/A4kth9hr7P+PqpFoV
	 EEc4WsyAoGbX5QzkAXQFBNvfuhhjuChnAPc9drvn/v/45hWxVXYlnQrFwO2cWwSKWv3F6
	 mAaeydRGfnzzJuLL1EGq5EXoyR+BwIlfRer5xLsmD9XJf8JLCYXCj4ogchV1NkpeQ/f+W
	 T+kbN+Qeths5RRHMGfGVv2986hDSXl9QtIS7MuYXEKFDoVQP6dlGb9KEk35UsdL2/ai1t
	 iUDhjUa0fkjWFQqqNCqbWqDubPh0u6nsHEmrwFtFzTbSa6mrosQeKCiuHh0c4PO3cQg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782786830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:List-Id:To:Content-Type;
	bh=xJnh1lxUSW7TcaumredCVaB8/h49xeWi5z3x52ZD+qs=;
	b=h5weapyw6VrIsfok0tXXnJdfQSWUkZv6hjyv8rXFIXK5oiktszc2UgHPUbOxqx+rZLmA
	 +FSTotY5GkGEDTb0eiP2NLKbRz/gJE5cmdyqFa+9Nkcun7z5YiOB2A8+lCsAGP9kN4s//
	 P5hUrKqnENgu5KwEhIZKbDgZThHglQHqSjH1P/USFfn/R7Fl1eWq91kBePUvK/EfwHfzZ
	 Dpr6zjiNoNQeTR3AGnV/rrpQguPUSMAEVcVer/PgRrcsfehSQUiXgP6gC5oOm3sSujGuE
	 iIhMYjcM+nMbeY+fgVk1K04H/wUdNHhS2X67DMBPild464WJfDAq9QPeCncxgj8ustA==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h9WCE957;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 080D01F00A3A
	for <linux-firmware@kernel.org>; Tue, 30 Jun 2026 02:33:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h9WCE957
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 080D01F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8de83f34437so4758786d6.1
        for <linux-firmware@kernel.org>; Mon, 29 Jun 2026 19:33:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782786829; cv=none;
        d=google.com; s=arc-20260327;
        b=M8LW8JkOHvjMEoogx7/XXNiN7QBpDd/HJ+uTnNnux9nqGDJfsZTSemKIQejePwKyZS
         c5UsE7SexWybm5xHppUBJwWF66Ep2kek2uhMAyiYG3ed+LZpXtmWPtXY5fo+oRt7I3Cr
         FdfdYJx1UYHI34laGgDvsjsZw7V8VXwY09mGQWj3rkz7e/A/q4cMSH5uBc8VScbcnHuK
         rosg9QYRb8TzSqMFYVLP7IeharMhWzaulSpvpCKdbMCnOnf+jeDyyyo/VurVk5O1I4gv
         vdieiwEHOBiYi2Uf8OpsjcqoU0ITcofVwB1Ht8QFnBSCzOnzBsuprClc2sCIUSOVh6Ls
         XuoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=xJnh1lxUSW7TcaumredCVaB8/h49xeWi5z3x52ZD+qs=;
        fh=thzlYDAT27MWbzz3if4rQyeooyybPz7D/zeQezHlJZA=;
        b=d+nK23aSOzq++p+DcBOzRbgqe5n7SfoTa8lQzbOM7UjOttyRemKygX+O58ivplTisK
         jX5j06N+qS2MmzlpNfxlEzxQppy9oHETNNi9ZWn4mBYzOcXq70SflgQW8lcO8UPmuCVu
         0jPArbkh0/IFMPeBoZtXRBDIeHu8iWgNuoxeO19IhviYx7Bu/Y/95bGDaI8Z4cjknabF
         IbKMaKs1C9dw+rAIEGpuRShHekZe/C3joRjXpFuHVN2Uls1zxNiXgf+TqRI2HG7keJPL
         nHdh6qNeZAfZbdD3ILNRst8729sBpkbFjUEy6CxGzQploV2NCbcEOTPidnqd2+hgBbZz
         wsgQ==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782786829; x=1783391629; darn=kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xJnh1lxUSW7TcaumredCVaB8/h49xeWi5z3x52ZD+qs=;
        b=h9WCE957qR8/0IOXAzdY7FT/Z+A2pAfp8dbWxr6B0twG12krL52TSjyPZ/GdFbLHEe
         G9ga0Xp216Ypw8dkeM+ClgjuIFANAVvZV7ixET0HeD7G/jm20IEvguWSaEvaSD/OMaN1
         DmfC6Cc9DrJb76kzVD6V5pAfhfrnYRyIzRbwRNKVgnSDpGcX9FLWyiIPeCZDmP3xqxTz
         Eds6ONDdoYOg7UtAdah9xJ0GxFLDhrx0KcQV+rJEQS8Ve9zd5sxRq3OheOzA+79m6wLo
         fUsDTSpleDlmLpeWk3+PvLd/ftjDVzkJOXgMq4RRDC/iGAOWoglGbqHmJeBFD47E8COO
         duyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782786829; x=1783391629;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xJnh1lxUSW7TcaumredCVaB8/h49xeWi5z3x52ZD+qs=;
        b=L7WZNTKsjGC25/Df9iiJv0sC/nNywoFSQSXBXIJ8/gkLW/wIRoJRciNaxaxSy8iMA/
         b/nOfSKlCr04FJb/xxcj/BrMYWZnB8EfVKvxUqOKo2uHNyg5kyudlvzXtITtWIEIrFzt
         ANG8Zl2Oo7kYQF815LQh7n4eX9eMIwAIc4xYg1cUVQcM9wzk3b2PbafDN0LLvCo9+TQO
         e3QVrSToYshWrr430LLloId8tGtYMpf5HOx3LxfSvQ/NBqbeghanKyZHd67TG1Le2mGk
         nnDkVa9dW0qH9UU6tqJF99Lsizs9CB2FxzKbzbezXTjJWykJc9qzOR3mOR2ZlJAAukpw
         Niyg==
X-Gm-Message-State: AOJu0YyTk8wW+4ksZhHO03zMXDka20LHN/oodGhB8XICS822i/dbZZui
	McjARkN3dkK4OBXSWDGDgV6toS5wbL6MVZaFsERbQMZbavCAyBh1whKJB4XMe68wM/ckV/qdjo1
	wXN3rfp86QVo0TqZyq1/bsBuFL0/F1XjYhxXlnXg=
X-Gm-Gg: AfdE7cks0IE/YWaWVVqNH7jw43d+dqxYBgZ6noLOUok0eZGR/EkrrCrfWRNBuL1ulpj
	1zWRXbZIWZzAdgbNVrGXnwwbN9dgPpBk94kL27NDMTpMLnorOhHzJlvLALxgAdP2ilqr0pz+t6/
	pM70R2UxUGhewpt6A7em9oqOvy7F6rweAg4TGQwSRJYvlkTYZFrooPlUzzF/Ysoa369KmBUyke1
	Awn0e+ELBT30OCduLRriQ4uYeyS2CmWwxbJlNbdHQXE5xge6LyOqfzxIUPRyPVU88WQ6Bkp
X-Received: by 2002:a05:6214:8393:20b0:8e8:a3c1:48c6 with SMTP id
 6a1803df08f44-8f1b8e6b7demr14245176d6.2.1782786829024; Mon, 29 Jun 2026
 19:33:49 -0700 (PDT)
MIME-Version: 1.0
From: Akiyele john <akiyelejohn@gmail.com>
Date: Mon, 29 Jun 2026 22:35:37 -0400
X-Gm-Features: AVVi8CcKVzG66OwwflaUcKCMd-TQapO0lQu7P-OVPly8VKMTmn3vtSIlDtxzaPg
Message-ID: <CAOTdt5GKPVQDSvjD1iv-ujtK_49BYnw_CGm-BRB-cdhvh5Jo=w@mail.gmail.com>
Subject: Simplify Lead Management with GoHighLevel
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="000000000000a7804c06556f6727"

--000000000000a7804c06556f6727
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, I specialize in building and optimizing GoHighLevel automation for
businesses that want more leads and better follow up. I=E2=80=99ve helped a=
 few
clients automate their pipelines and booking systems. Would you be
interested in seeing a sample of the setup?

--000000000000a7804c06556f6727
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi, I specialize in building and optimizing GoHighLevel a=
utomation for businesses that want more leads and better follow up. I=E2=80=
=99ve helped a few clients automate their pipelines and booking systems. Wo=
uld you be interested in seeing a sample of the setup?=C2=A0</div>

--000000000000a7804c06556f6727--
