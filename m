Return-Path: <SRS0=UpL1=E7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FBEC56201
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2020 16:04:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C2432087C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2020 16:04:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qF0XQS7T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wh6ZKgpt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C2432087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EDL4hmrwlYBt9e3EAWMal++duB4+bioHuj9y22Pf28w=; b=qF0XQS7T7yzcLCRzf5KpyC4IA
	bDpr+LxkdXaahhV5QcS/jNUem7VV3yVStbNnomn8G70zwYzbwsjsiTCy1cwHymZe7P9YUl8ZXJ9KE
	ZVurhm7M+0NnWYvPEybAoBnFSUVQ+a0oHPyLvbM11NGEzjxAxmzfr5KkKJjUqTfM92fpOxyNcjSsO
	Pq387S7iy7dv4VQ65OAZdvyXaDJrpCZD2jUc7HC+uO03yDp7Hs9j3YsI4/j9joUnby6/I+ZJ2o4pq
	gmrfN8rin/pe41q0FNwQ5OdboC0AMH1szmFrM7wgWfk/fC+0Kdx6ynmSu9AkJtTzXnU1GoMi5k3yt
	xzxV2Xddg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khxFv-0006Uq-V7; Wed, 25 Nov 2020 16:02:56 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khxFt-0006TG-D4
 for linux-arm-kernel@lists.infradead.org; Wed, 25 Nov 2020 16:02:54 +0000
Received: by mail-wm1-x333.google.com with SMTP id x13so1846488wmj.1
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 25 Nov 2020 08:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=faq1+9tTPdxCtY6FguahbIN67FRejTlywlCZQqt2oe8=;
 b=wh6ZKgptF2+qYD0yEthHOAgj7pIBNSvshKJII2U46GmfjCiXOs87Toyd06mWtOIPRZ
 gZgguxqEWZHChR41Q8h7pejygqsWzIiC7Gtpq8UF9pHIKzwW4vLB+kJ13J3MU4UZKtSx
 5UghkCEAH/JrOEjHtYSg6quRzQfNbxeECYLLe9JtVO0l3R5LdO5+EXRJ1i68QaqKCQzZ
 Wp7pDOPgit1s1rTCZy4UqrPeVYD/Pu/MCnCTRSaVA8QTmEIG08IpzJ/Hhajk9P6BolrC
 d8Ut7Xd1Wvd00VGgGgqRYZ1KMMfSSPL+P46QQjVt//IWvoQzDG6zs3iGkNR7hPk7y3en
 yoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=faq1+9tTPdxCtY6FguahbIN67FRejTlywlCZQqt2oe8=;
 b=onhpPSyIkG9l5fo3dLZ8cJp0+a//HEHfRqSqwSpQvOm7b7YIXlYFFoeq3BzXk77ewT
 neYF/BwGolOtfAOYemcOdQFeO+Hl78QNlksITR253EFAiV1/wflr/3hVXBu5WCTRQ/Uw
 Z3A/qQEdXnczt6EtW0Eq8cCe/ckjGzYAzr8MvcEB8I5eXxf/DSVryvkEhOHHoFIQuXkT
 WnsC5UFOzJ32q7vnx/pEdcOFvkTi8pjfZMdYcVYueSog+nwCTTCMGKQyybWGqnCyKFBW
 RHu/SCn6qXQSVKQx99GfGQ18VupvJWGNAas+m/DhGUzE1duv7cjvjq7jWXaHdMYK0R/A
 B/7w==
X-Gm-Message-State: AOAM532hwefziUOmsF4HqNUkZMUaZDCb+PxcAOzh43BEr1JWYn5IUD5g
 BIvJRrhPz3KM93HV5b3jZPtzAA==
X-Google-Smtp-Source: ABdhPJyQNKoY/euMK6ZNcUesyn+9MjGKx1xKvWODLY1oc209ES/XbDBtdKUVvLPEyxPL5ITqdOlyWw==
X-Received: by 2002:a1c:a445:: with SMTP id n66mr4703972wme.51.1606320166784; 
 Wed, 25 Nov 2020 08:02:46 -0800 (PST)
Received: from [192.168.0.3] (hst-221-81.medicom.bg. [84.238.221.81])
 by smtp.googlemail.com with ESMTPSA id k16sm5581374wrl.65.2020.11.25.08.02.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2020 08:02:46 -0800 (PST)
Subject: Re: Update venus firmware files for v5.4 and v5.2
List-Id: <linux-firmware.lore.kernel.org>
To: asitshah@codeaurora.org, linux-firmware@kernel.org,
 linux-arm-kernel@lists.infradead.org, mchehab@infradead.org,
 linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
 linux-media-owner@vger.kernel.org
References: <78c092f9b8d8b3833d7ac4f36253f7d3@codeaurora.org>
From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <c7da805a-65a8-6011-e710-b7ffa29492a3@linaro.org>
Date: Wed, 25 Nov 2020 18:02:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <78c092f9b8d8b3833d7ac4f36253f7d3@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_110253_484611_E79A8FF2 
X-CRM114-Status: GOOD (  20.52  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: dikshita@codeaurora.org, sampnimm@codeaurora.org, vgarodia@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201125160244.ug9U7rpcSaCbww7Xr3tBWAoNoWZFdR9-Lg4J4adKHmk@z>

SGkgQXNpdCwKCndpdGggNS4yL3ZlbnVzIHVwZGF0ZWQgZmlybXdhcmUgSSBzZWUgZm9sbG93aW5n
IGVycm9ycyB3aGlsZSBsb2FkaW5nCnZlbnVzIGRyaXZlcjoKCk5vdiAyNSAxNTo1Nzo1MCBsaW5h
cm8tZGV2ZWxvcGVyIGtlcm5lbDogWzQxODY4My42MDkyMDldIHFjb20tdmVudXMKYWEwMDAwMC52
aWRlby1jb2RlYzogaW52YWxpZCBmaXJtd2FyZSBtZXRhZGF0YQpOb3YgMjUgMTU6NTc6NTAgbGlu
YXJvLWRldmVsb3BlciBrZXJuZWw6IFs0MTg2ODMuNjE2MzU0XSBxY29tLXZlbnVzCmFhMDAwMDAu
dmlkZW8tY29kZWM6IGZhaWwgdG8gbG9hZCB2aWRlbyBmaXJtd2FyZQpOb3YgMjUgMTU6NTc6NTAg
bGluYXJvLWRldmVsb3BlciBrZXJuZWw6IFs0MTg2ODMuNjMxNDM5XSBxY29tLXZlbnVzOgpwcm9i
ZSBvZiBhYTAwMDAwLnZpZGVvLWNvZGVjIGZhaWxlZCB3aXRoIGVycm9yIC0yMgoKUGxlYXNlIGRv
bid0IG1lcmdlIGl0IGluIGxpbnV4LWZpcm13YXJlIHVudGlsIHdlIGFyZSBub3Qgc3VyZSB3aGF0
IGlzCmdvaW5nIG9uIGhlcmUhCgpPbiAxMS8yNS8yMCAxMDo0MSBBTSwgYXNpdHNoYWhAY29kZWF1
cm9yYS5vcmcgd3JvdGU6Cj4gSGkgVGVhbSwKPiAKPiBQbGVhc2UgaW5jbHVkZSB1cGRhdGVkIFZl
bnVzIEZpcm13YXJlIGJpbnMgZm9yIHY1LjQgYW5kIHY1LjIgLgo+IAo+IFNuYXBzaG90IG9mIHB1
bGwgcmVxdWVzdCBpcyBhcyBiZWxvdywgbGV0IG1lIGtub3cgaWYgYW55dGhpbmcgaXMgbWlzc2lu
Zy4KPiAKPj4+Pj4+Pgo+IAo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQKPiBi
MzYyZmQ0Y2I4OTYzYWQ3NTUxN2RiY2Y0MjQ5NzRmNjVhMjlhNjBlOgo+IAo+IMKgIE1lbGxhbm94
OiBBZGQgbmV3IG1seHN3X3NwZWN0cnVtIGZpcm13YXJlIHh4LjIwMDguMjAxOCAoMjAyMC0xMS0y
NAo+IDA5OjU1OjAzIC0wNTAwKQo+IAo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIGdpdCByZXBvc2l0
b3J5IGF0Ogo+IAo+IMKgIGh0dHBzOi8vZ2l0aHViLmNvbS9zaGFoYXNpdC9saW51eC1maXJtd2Fy
ZS12aWRlby90cmVlL21hc3Rlcgo+IAo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBl
NjQ1OWRjZTg5M2E1YjhkYmY2ODQ3NjJkNTM5NmFjYzExMTQ5MTg2Ogo+IAo+IMKgIHFjb20gOiB1
cGRhdGVkIHZlbnVzIGZpcm13YXJlIGZpbGVzIGZvciB2NS4yICgyMDIwLTExLTI1IDE0OjAyOjEw
ICswNTMwKQo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBBc2l0IFNoYWggKDIpOgo+IMKgwqDCoMKgwqAgcWNvbSA6
IHVwZGF0ZWQgdmVudXMgZmlybXdhcmUgZmlsZXMgZm9yIHY1LjQKPiDCoMKgwqDCoMKgIHFjb20g
OiB1cGRhdGVkIHZlbnVzIGZpcm13YXJlIGZpbGVzIGZvciB2NS4yCj4gCj4gwqBxY29tL3ZlbnVz
LTUuMi92ZW51cy5iMDAgfCBCaW4gMjEyIC0+IDIxMiBieXRlcwo+IMKgcWNvbS92ZW51cy01LjIv
dmVudXMuYjAxIHwgQmluIDY2MDAgLT4gNjgwOCBieXRlcwo+IMKgcWNvbS92ZW51cy01LjIvdmVu
dXMuYjAyIHwgQmluIDgzNzMwNCAtPiA4NTY0MzIgYnl0ZXMKPiDCoHFjb20vdmVudXMtNS4yL3Zl
bnVzLmIwMyB8IEJpbiAzMzY0MCAtPiAzMzY0OCBieXRlcwo+IMKgcWNvbS92ZW51cy01LjIvdmVu
dXMubWJuIHwgQmluIDg4MzI2NCAtPiA5MDI0MDAgYnl0ZXMKPiDCoHFjb20vdmVudXMtNS4yL3Zl
bnVzLm1kdCB8IEJpbiA2ODEyIC0+IDcwMjAgYnl0ZXMKPiDCoHFjb20vdmVudXMtNS40L3ZlbnVz
LmIwMCB8IEJpbiAyMTIgLT4gMjEyIGJ5dGVzCj4gwqBxY29tL3ZlbnVzLTUuNC92ZW51cy5iMDEg
fCBCaW4gNjgwOCAtPiA2ODA4IGJ5dGVzCj4gwqBxY29tL3ZlbnVzLTUuNC92ZW51cy5iMDIgfCBC
aW4gODczNjgwIC0+IDg3MzcwNCBieXRlcwo+IMKgcWNvbS92ZW51cy01LjQvdmVudXMuYjAzIHwg
QmluIDMzNzkyIC0+IDMzNzkyIGJ5dGVzCj4gwqBxY29tL3ZlbnVzLTUuNC92ZW51cy5tYm4gfCBC
aW4gOTE5NzkyIC0+IDkxOTgxNiBieXRlcwo+IMKgcWNvbS92ZW51cy01LjQvdmVudXMubWR0IHwg
QmluIDcwMjAgLT4gNzAyMCBieXRlcwo+IMKgMTIgZmlsZXMgY2hhbmdlZCwgMCBpbnNlcnRpb25z
KCspLCAwIGRlbGV0aW9ucygtKQo+IAo+IDw8PDw8PAo+IAo+IFJlZ2FyZHMsCj4gQXNpdAoKLS0g
CnJlZ2FyZHMsClN0YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFybS1rZXJuZWwK
