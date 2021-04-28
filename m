Return-Path: <SRS0=2Xr5=JZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6986C43462
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Apr 2021 13:50:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36F8A613C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Apr 2021 13:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36F8A613C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CMTVlDB4NfXXbOBsqZMMpqR2Y7Ea1d8zTs4ZUh7KkjM=; b=oiTo6a5/4gAx+j53IqZH+0pm8
	9Jv+XYZGtIGBEvj7ehj59FEFs2Lc5Y9bo8b+NZFHcJ6lUd/zf/pTTFc9yW9ZAJhsFCZSpVJBJjpr/
	aSil0MLCQdAEIDZPvPlgBYx5SZe1VKxfoPlkfSZSDj1JeuEyik8FCKlbl0vwLpLtyBs8EKyWCHrrZ
	AW9ow4mLWy28I47RPLiP+dBX2aV4dWy8wVHKu55iljeKd5dTzj/igRHdsdfpFijJwBMNayOQz9bS5
	O+WPjMIordoofh+INUjL73fXlYYu60YbPN7JY8fIvmhuGNtJwZym+vXvAVUCCYfgPWEZDslVBAsrF
	4wgQHgJzQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbkY7-003YP1-9O; Wed, 28 Apr 2021 13:48:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbkY3-003YOt-SI
 for linux-arm-kernel@desiato.infradead.org; Wed, 28 Apr 2021 13:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=NPJFa1yPhrLq0PnWDq7NJrMIFlW4oE6/GyqIVm0OSjQ=; b=3aq6/lCcyYsj+2+2hKrs0bA2a8
 dO86q6NBzsN57x6iOoYGyQsLLVFkHB6YplBvdiRO6Uhzl1FnUq+DSKaF1R6gQnrnoKuw5yzdLFt4G
 2T1vhJfhNwGBTpDPv1r2wrl8HrNJYm8U7KuxTl4ZNYPKx48cy9+dSiXn9KQrkiH/JShjmmpGTn3J7
 yR2zMBvknhiT9+3A+8sqGZEzPkKxEXdSYgBzGxjqu/+BBsvrZCITKXJSCVH83CpRMJgjNCuYYBGNj
 5sVnsKD/TafRwMGYi2F4/o0CEf7p3G/bQEyfQ0VMoAxozyLkXFYrHDgkdlXK+5El84REt/gLiCkX7
 WQI+sCvA==;
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbkXz-00HStM-7M
 for linux-arm-kernel@lists.infradead.org; Wed, 28 Apr 2021 13:48:13 +0000
Received: by mail-ej1-x62a.google.com with SMTP id l4so94695978ejc.10
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 28 Apr 2021 06:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NPJFa1yPhrLq0PnWDq7NJrMIFlW4oE6/GyqIVm0OSjQ=;
 b=o+0LiwxEgpzlqOLtELHEXA0LhFqL5ZRAe5RWrHVf4fx5HL5oZPsMUiB01IzQ/FOCjs
 Ok7IfxuomUUCB6wFMd3QKtPYxlryhcvc8thhicSD+sXy2t+nIT/AWiZt5qlCBaeaP5qo
 fQpZ1u2NxaVuhN69Hb55UrUUlhor4wPg2M+1dRJcstJkNaM1zgiX16CHGzxVq6JjvJYy
 67zM1AlxlSaodd/5ApFXn+BiPez1NksXtekEPrOO/smOWeXvCMFix+FaEQtdim1e9vTA
 SLjleD/WfW5T1QAOPgTh4gvJwL+WPzs5hSmhW2OECuhL+W2kpcJVQkUt8k7IOBMdHq1Y
 Iq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NPJFa1yPhrLq0PnWDq7NJrMIFlW4oE6/GyqIVm0OSjQ=;
 b=mDmVANYGUMlPicabD9Qcs+m2+amNj7cYiun2QW2wToggvvHtXBWVYI4aKpqziX4HJU
 2bKQad9Aez2ahQACrv6a4BHiEDhy02JW0vLbYo5hQAj2LuFpA5VLm4C6q191Nvoy2g66
 m241VgyWINWOiax46JMBcplBFpABhXsOpnJ99tVINpx8QwmV5AHxPw69K0XB0fwwoRO5
 Qjb2LYuB+Er2SO6TyyWri5OIl6t52Qi3pUPbN6PRdcMbxpitd5cedfvXrDWpjayUTbWg
 tyHtDsd9vgBodh9R6ZbOTkukj39tbOjWkFu9mk6VWIxh9MgHvgAtJxzNcHlJIUeaHiG6
 SjWg==
X-Gm-Message-State: AOAM531trbsLygkRUEM00ZHQ+UVAsz5xRjn0YTkv93/0x5CFczwEs8wl
 FIuwYpY8X55snZcPEBVX7/zSCA==
X-Google-Smtp-Source: ABdhPJxabnOp31u5I9SpC9p+kssNW+G7GHHKzD880x1P41RkZh5iFTBtUN9HN7ZDuWqWDm7pWtS3Eg==
X-Received: by 2002:a17:906:c297:: with SMTP id
 r23mr7474073ejz.144.1619617687749; 
 Wed, 28 Apr 2021 06:48:07 -0700 (PDT)
Received: from [192.168.1.14] (hst-221-20.medicom.bg. [84.238.221.20])
 by smtp.googlemail.com with ESMTPSA id k12sm4949564edo.50.2021.04.28.06.48.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 06:48:07 -0700 (PDT)
Subject: Re: Update venus firmware files for v5.4 and venus firmware files for
 VPU-2.0
List-Id: <linux-firmware.lore.kernel.org>
To: smagar@codeaurora.org, linux-firmware@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 mchehab@infradead.org, linux-media-owner@vger.kernel.org
Cc: vgarodia@codeaurora.org, dikshita@codeaurora.org,
 adhudase@codeaurora.org, sampnimm@codeaurora.org, mansur@codeaurora.org
References: <bee73b3fe8b04c1a2663be0cd3cc7318@codeaurora.org>
From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <9eaaec5d-a7d4-1889-5c92-28944b198adc@linaro.org>
Date: Wed, 28 Apr 2021 16:48:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <bee73b3fe8b04c1a2663be0cd3cc7318@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_064811_285920_2788D0B8 
X-CRM114-Status: GOOD (  18.24  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210428134806.Cy-uaY9ifWI1xwxkHyPRjV4fuYeiDrbFxdS6PkmCN9M@z>

CgpPbiA0LzI4LzIxIDM6MzIgUE0sIHNtYWdhckBjb2RlYXVyb3JhLm9yZyB3cm90ZToKPiBIZWxs
byBUZWFtLAo+IAo+IFBsZWFzZSBpbmNsdWRlIHVwZGF0ZWQgZmlybXdhcmUgYmlucyBmb3IgdmVu
dXMtNS40IGFuZCB2cHUtMi4wLgo+IAo+IEkgaGF2ZSBmaXhlZCBjb21tZW50IGFuZCB0aXRsZSB1
cGRhdGVkLgo+IAo+IFJlbW92ZWQgMCBieXRlIHVud2FudGVkIGJpbnMuCj4gCj4gQmVsb3cgaXMg
Y29tYmluZWQgcHVsbCByZXF1ZXN0IGZvciB2ZW51cy01LjQgYW5kIFZQVS0yLjAuCj4gCj4gUGxl
YXNlIGZpbmQgc25hcHNob3Qgb2YgcHVsbCByZXF1ZXN0LCBsZXQgbWUga25vdyBpZiBhbnl0aGlu
ZyBpcyBtaXNzaW5nLgo+IAo+IAo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQK
PiA4NTI4NjE4NGQ5ZGYxYjAzYmI3NjA0OWVkY2ZkODdjMzljZTQ2ZTk0Ogo+IAo+IMKgIE1lcmdl
IGJyYW5jaCAnZm9yLXVwc3RyZWFtJyBvZgo+IGdpdDovL2dpdC5jaGVsc2lvLm5ldC9wdWIvZ2l0
L2xpbnV4LWZpcm13YXJlIGludG8gbWFpbiAoMjAyMS0wNC0xOQo+IDExOjM0OjExIC0wNDAwKQo+
IAo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIGdpdCByZXBvc2l0b3J5IGF0Ogo+IAo+IMKgIGh0dHBz
Oi8vZ2l0aHViLmNvbS9zdXJhajcxNC9saW51eC1maXJtd2FyZS12ZW51cy5naXQgbWFzdGVyCj4g
Cj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDZjZGVmMjgxY2QxNmQ5NjdhZDg5YzAx
YWY2ZmRkYTg1NTI5YTJkODA6Cj4gCj4gwqAgcWNvbTogQWRkIHZlbnVzIGZpcm13YXJlIGZpbGVz
IGZvciBWUFUtMi4wICgyMDIxLTA0LTI4IDE0OjQyOjQ4ICswNTMwKQo+IAo+IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBz
bWFnYXIgKDIpOgo+IMKgwqDCoMKgwqAgcWNvbTogdXBkYXRlIHZlbnVzIGZpcm13YXJlIGZpbGVz
IGZvciB2NS40Cj4gwqDCoMKgwqDCoCBxY29tOiBBZGQgdmVudXMgZmlybXdhcmUgZmlsZXMgZm9y
IFZQVS0yLjAKPiAKPiDCoFdIRU5DRcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCAzNCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gwqBxY29tL3Zl
bnVzLTUuNC92ZW51cy5iMDDCoCB8IEJpbiAyMTIgLT4gMjEyIGJ5dGVzCj4gwqBxY29tL3ZlbnVz
LTUuNC92ZW51cy5iMDHCoCB8IEJpbiA2ODA4IC0+IDY4MDggYnl0ZXMKPiDCoHFjb20vdmVudXMt
NS40L3ZlbnVzLmIwMsKgIHwgQmluIDg3MzY4MCAtPiA4NzM1OTYgYnl0ZXMKPiDCoHFjb20vdmVu
dXMtNS40L3ZlbnVzLmIwM8KgIHwgQmluIDMzNzkyIC0+IDMzNzkyIGJ5dGVzCj4gwqBxY29tL3Zl
bnVzLTUuNC92ZW51cy5tYm7CoCB8IEJpbiA5MTk3OTIgLT4gOTE5NzA4IGJ5dGVzCj4gwqBxY29t
L3ZlbnVzLTUuNC92ZW51cy5tZHTCoCB8IEJpbiA3MDIwIC0+IDcwMjAgYnl0ZXMKPiDCoHFjb20v
dnB1LTIuMC92cHUyMF8xdi5iMDAgfCBCaW4gMCAtPiA2OTIgYnl0ZXMKPiDCoHFjb20vdnB1LTIu
MC92cHUyMF8xdi5iMDEgfCBCaW4gMCAtPiA3Mzc2IGJ5dGVzCj4gwqBxY29tL3ZwdS0yLjAvdnB1
MjBfMXYuYjAyIHwgQmluIDAgLT4gMzAwIGJ5dGVzCj4gwqBxY29tL3ZwdS0yLjAvdnB1MjBfMXYu
YjAzIHwgQmluIDAgLT4gMjAgYnl0ZXMKPiDCoHFjb20vdnB1LTIuMC92cHUyMF8xdi5iMDQgfCBC
aW4gMCAtPiAyMCBieXRlcwo+IMKgcWNvbS92cHUtMi4wL3ZwdTIwXzF2LmIwNSB8IEJpbiAwIC0+
IDIwIGJ5dGVzCj4gwqBxY29tL3ZwdS0yLjAvdnB1MjBfMXYuYjA2IHwgQmluIDAgLT4gMjAgYnl0
ZXMKPiDCoHFjb20vdnB1LTIuMC92cHUyMF8xdi5iMDcgfCBCaW4gMCAtPiAyNCBieXRlcwo+IMKg
cWNvbS92cHUtMi4wL3ZwdTIwXzF2LmIwOCB8IEJpbiAwIC0+IDE2IGJ5dGVzCj4gwqBxY29tL3Zw
dS0yLjAvdnB1MjBfMXYuYjA5IHwgQmluIDAgLT4gOTM5MTg0IGJ5dGVzCj4gwqBxY29tL3ZwdS0y
LjAvdnB1MjBfMXYuYjEwIHwgQmluIDAgLT4gNDI5NzYgYnl0ZXMKPiDCoHFjb20vdnB1LTIuMC92
cHUyMF8xdi5iMTkgfMKgwqAgMSArCj4gwqBxY29tL3ZwdS0yLjAvdnB1MjBfMXYubWJuIHwgQmlu
IDAgLT4gMjAzMTE4OCBieXRlcwo+IMKgcWNvbS92cHUtMi4wL3ZwdTIwXzF2Lm1kdCB8IEJpbiAw
IC0+IDgwNjggYnl0ZXMKCldoaWNoIFZlbnVzIElQL1NvQ3MgdXNlIHZwdS0yLjAgZmlybXdhcmU/
IEFuZCB3aGF0IGlzIHRoZSBkaWZmZXJlbmNlCndpdGggZXhpc3RpbmcgdnB1LTEuMD8KCi0tIApy
ZWdhcmRzLApTdGFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hcm0ta2VybmVsCg==
