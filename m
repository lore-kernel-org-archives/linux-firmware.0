Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9266606A31C
	for <linux-firmware@archiver.kernel.org>; Tue, 10 Nov 2026 05:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ai4GAkLp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vb68cQZn
Received: by smtp.kernel.org (Postfix)
	id D142B1F008A1; Tue, 10 Nov 2026 05:56:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794290187;
	b=kX/PvIRQirVJkEpvV/ys0/T074PxgQGowMp8lf5C0gJy9RtLA8dl+dUby9mrHnHOslyx
	 RmMGoSviSB0l0BdSA5ISa8H7/c8pMwcP1Al44NyRqb6+ujpJdkIRukzaKzAmvALeBcDOG
	 Mkz1pAOHEyYi1pmQhLZIG6SDg7QKjNntvEtZO9xTtbm662DJpG1tU/AjbfB7n/IZJsJnF
	 hSktI+IhBptRHFLLGjUxVIH3lw7nz2i/Yw558uNSea5ItBSgejvTCH10WtYd+1+2/YPmC
	 o9E0DHZDZ+fLw2YFJkX93/kHlvkb4ulu7caP449YR0ZNUiQ0V0XpVoXtrUKG3bQ466w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794290187;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tp0adjuxQjGNw1wxJy1eogT9ncN8Xu4aQYcxXSm2MIA=;
	b=fKykTVYD1Kwl784ylO9GAAxmTbWpsynV3J9TBHbiei9es+fNEH1YQzSn7b2SETSJPDq2
	 X1SZmUhWtGbvgvd2z+khA7THe1/BFMD8maZm7usWtorXJd2KnL3OJOi+EauIkrR6fePG1
	 XsxZYxwXHGccWd81+yIG2kZprQYToEQ8fpKVeEEP8himgycVztCiBtavtN9lEY66oUHEe
	 Vh0u/Z7ThzjnyU5/PFq2TJja5XTK6iRbA3bOEgoxSh8hbpPn2UgbZE92Sb2YLpOHdndWn
	 QCfMqONx6ZlJ2HG9PSBrdAj2T+p99XJMFRsnqjaTfJxD3tWpQ2kAx8lNES9ZNJFfxLA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ai4GAkLp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vb68cQZn;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF06D1F0089F
	for <linux-firmware@kernel.org>; Tue, 10 Nov 2026 05:56:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ai4GAkLp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vb68cQZn
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org EF06D1F0089F
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4AAtP2928593
	for <linux-firmware@kernel.org>; Tue, 10 Nov 2026 05:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tp0adjuxQjGNw1wxJy1eogT9ncN8Xu4aQYcxXSm2MIA=; b=Ai4GAkLpjk12xbWD
	UEMFbHlg+/Ka73I46mH4DpmNdpJHp6f2BZNUUMgXjEwts0jFbGPWtbicrhQV5f4j
	GEqRUcUPcEzQ6zlKOJ9wCCJDV2rTgWtAsHKRJvGH+U1p4eH3rh737/f5g+h9xe50
	GSW7k60BS0mOGrtqTRYBJjOpIcF9Unr+Mcs0jwGhPrlEO0hEW9rTJjGxCxuH6DfZ
	M2LiicnWSFXgfwxlgdNwZWPF3ox8z3b4hZwEfEA4WyEjWuX3/RFwrJ4U/V5pZPeD
	HfSc/ytQcVtgwVVJ7Jfg2ZksozErJZjthoz3+j0xqErhansLNTZ1NVHpovQywEYN
	Elr8IQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx837n8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 10 Nov 2026 05:56:25 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67bc496cf97so427307d50.2
        for <linux-firmware@kernel.org>; Mon, 09 Nov 2026 21:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794290185; x=1794894985; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tp0adjuxQjGNw1wxJy1eogT9ncN8Xu4aQYcxXSm2MIA=;
        b=Vb68cQZnE9SO8H/mKHuf8b5iE1r/icI9FrrOxTpY//xTtksfLQNkomD3n/gpQGfQQk
         OHqskRB0mQmwX42nWYB+fqI3cRA6VJpZi9eqUezyDlReZpY+S4DJq2DzTx2JnpUyoJxd
         ChEW4cYqV7+1yX3u5T4fd+BLgCQmPzW2bKdYsfHGMTwptj9rmFpMaR4PTNGBhib+yBaC
         Ysty+PtIM76q9C8/diy1nCrPHx+RR+T/v0Mvod9K+cOtrT4r+IG9xAjgwc+kBJNUN/w7
         l5bl3O0Noj25XctTz++tJjL9VY1DaTAH8xNPBthT4i+lxJX+xz8yhbDctqFtWmWE4CoB
         T6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794290185; x=1794894985;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tp0adjuxQjGNw1wxJy1eogT9ncN8Xu4aQYcxXSm2MIA=;
        b=fjdFkGb3Ymwzrv9JzeSvf7DQFfucWgNsLqgOwgojs3JdPuq8NKfOw5f1A1n+O0PiLy
         f3yfIinvrRrVtp9nQo0+sG1O2I737a66UBmNLMR6JYHXWhDXTFuaoejHwj7b1dCCOLN5
         EJ20NR4ly6TMhmDEtWRaqxaVjO5Gy3j07RWL5UzekFk8pihmzWekDKFDy2W9JXw8/JfS
         BvEvlw/Mj32cenXVdp61q3WaXHE6OMrBh3wVKBj+rETkg9U5u7XrQQfZ+Oq9tRX7YqbA
         TGWg3csQPtIAPlXkpk4L7OQcDZ7aoJU2V9LyZKfX4d09Q3eUSR5aI/oo0unelJXqeh0s
         cRZg==
X-Gm-Message-State: APuU4Z8VDpiWHM8fEobaNcZddBr8gXuYTAf0qT/0Rh1IMk4Sf4QJUJA9
	Yo+R9KJJ3+/Hw5OpAGKFGBe5Fsqh7BIhg1+5gIkKfWW0JQuECLWBlv3dU1Zpy2hU7sZwfjgF45H
	Gpk0k+Yzpc/tJFEWY1CroqF2ylh7sI6PTBmAeZm3QH5eI+Jcbp9uWFWIKe/MkKnY=
X-Gm-Gg: AYBFou2mEdp614ujiW/hlirgmkWx1yJE7WLknSe4PLS7s2nI01ZAR7nzn3r0dXwokzI
	3COp09bo0FTHzb7jT4jf7J9+Fhc/HXXvXQNaPO8OgFQx+fJQMy3NrGSOn+eZKvSF8zKV/eq1vKs
	qiOHndt7P97Is+tIrxM0Z3J1Z8sTWDPYlELptpOhZxowGJPupI1F8YtkEM17gH/LrEoBwlmAzk6
	8KlR56ooCwES/LWEphcYk43ks9ZXNMkMcxJt7hCDs+tloKqjy+XaA45w2D6E+hOYjtPO0sh0KCN
	iMEKgs1jQ/WZRchH2mpLa0bMYhV42DXoLi+OXFJT0b70EokgA6V/nOmvW3xS2os2BoJv/ySQdjc
	LFEd1VGEg2dprxdnmevrM6wl/R4mD/hpIAVjKuWyS3+HuXrgpM4hZ6kHnvxelPPkvL+HRAiMLp9
	3Qrz3vBIVwKvnUWSDgazqkQDlBAdRfZMLgw6d5aw==
X-Received: by 2002:a05:690e:4891:20b0:679:887f:a2c0 with SMTP id 956f58d0204a3-67c567d7c69mr1421903d50.4.1794290185255;
        Mon, 09 Nov 2026 21:56:25 -0800 (PST)
X-Received: by 2002:a05:690e:4891:20b0:679:887f:a2c0 with SMTP id 956f58d0204a3-67c567d7c69mr1421366d50.4.1794290172682;
        Mon, 09 Nov 2026 21:56:12 -0800 (PST)
Received: from [10.249.8.192] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm4135042eec.7.2026.11.09.21.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 21:56:11 -0800 (PST)
Message-ID: <62e5587b-9b01-4eba-bda0-ddd26e092712@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 13:56:09 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL] qca: dedup QCA USB firmware files
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <20261105112700.21315-1-dmitry.baryshkov@oss.qualcomm.com>
 <20247457-3e1e-4e59-b297-9e422ddccd55@oss.qualcomm.com>
 <oqo6fnkxm2hbl4a5vwvivn35f2o2fu43ggdidyuqbghjgdfwsh@u2blubebipa2>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <oqo6fnkxm2hbl4a5vwvivn35f2o2fu43ggdidyuqbghjgdfwsh@u2blubebipa2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af2b209 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=jX4A9_CKik1hYCAsUggA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-GUID: UMtQu4es0nKkklOiB9i1wp8y7F90i6Ec
X-Proofpoint-ORIG-GUID: UMtQu4es0nKkklOiB9i1wp8y7F90i6Ec
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyMyBTYWx0ZWRfX9RlgAhH9+Tpy
 HR3LXWDiF8QCauUTHMsxp5CBZpK7kuya3OJJJn/gmNSNVucmuGf34QXbTbjOPvbTSeof8hfWQi7
 UpN70G4eJF2e/wBan23zEk5znLDIuaI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyMyBTYWx0ZWRfX1380lFrRKHLM
 0DaRHgtKbLsEA0+Lqyf+i/qlvMURBY82E327F4Dvo7uRLeUcSo3bPxz4Q5LyoFy7zRe6rlRp6pD
 SGiMNnvQ8zi4rzGju6lEWLZmM650osgowpkf3qkYKLJLb4tBVP5jPaMoz6yNuOHKXOyRugCtO0L
 nD0ZBRLDC63t/a+1KShXg0ZP3cX0FDQZdsVwQs8z/evp/sR1zmmaXj+ukBwuCMq8JVXZ3OYr1tP
 y7p0NpS4q4dJx725JSLeVOIr0KR00906ZoxGFcpiKkw0FAFgfGZiZcWfUmdUnjYWIk/1StQ1crX
 BJYeY4PeHWWR793qNhq1y6N2HprYE/LYpxMYdWS2O3dNOV3GLWGPsokFuGuOyseKxY4CaqX53m6
 ESSwIzqWAy2PO6yBxJSDNmKe3jIEjAYD29cWjvrZzEJBLLemdMnAy1Iw1FrjBUYG1P+GbyHxarf
 zTUs3HuCwMCNkHZoYkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100023
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/7/2026 4:51 AM, Dmitry Baryshkov wrote:
>>>       qca: QCC2072: Replace duplicate firmware files with links
>> Reviewed-by: Zijun Hu zijun.hu@oss.qualcomm.com
>>>       qca: QCA61x4 USB: Replace duplicate NVM files with links
>> Reviewed-by: Zijun Hu zijun.hu@oss.qualcomm.com
> I'll land these two.
>

Thanks!
I'd appreciate it if you could land them soon.
My upcoming WCN685x BTUSB firmware update is based on top of these two commits.

>>>       qca: QCA61x4 USB: Link 00000201 firmware to the 00000200 files
>>   Suggest dropping this commit. 00000200 is for ROME v2.0 and
>>   00000201 is for ROME v2.1. They are separate chip revisions and
>>   should not share a firmware build ID, so their firmware is usually
>>   updated separately.
> These files were added in 2015 and never updated since the initial
> commit. I'm not sure how your comment is relevant. If there are any
> updates which were not posted upstream, then please do.

Sorry, I didn't explain my point clearly. I will update the firmware
for these legacy controllers when we get to them in the cleanup.

For rampatch_usb_<ID>.bin and nvm_usb_<ID>.bin, a different ID
usually means a different BT controller variant with its own
firmware. For example, in the upcoming WCN685x BTUSB update,
0x00130200 (ROM 2.0) and 0x00130201 (ROM 2.1) use different
firmware code branches, and we don't update them together.

So I'd like to keep to the 3 rules above and not link firmware
across different IDs.
