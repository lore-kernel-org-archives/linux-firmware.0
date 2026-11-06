Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474DE606A339
	for <linux-firmware@archiver.kernel.org>; Fri,  6 Nov 2026 20:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PBJf6DCA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EHjp9Rpx
Received: by smtp.kernel.org (Postfix)
	id 38A241F0089F; Fri,  6 Nov 2026 20:51:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793998306;
	b=bzGmSCjqzK6ikoVR+7A/SUzLen6QIBp4XQqtFepeUWf8SfbFhSvvTmQ2JVFeUeLPN7bg
	 bDR2LmNAp53agOE2Zxn5oOMR1xoXtWlK4qFOnO21dUtMjsTrurJyn+ddQYa+f8uvAVqQD
	 KiQZymazOphfE4b/6KjdEbf+HSlOb2WHhy8yPBapMEgnzZrHilvYhvIwBhUkBcC7oUfn7
	 qNY6SIf+43zt996vgFR/Y8IF1xOnqkzhx2h6SQxMCwkTphtPgBArH9RZ5H3ylMF63t/7U
	 R9V3VkP950Lh7uGHblRvraOw8kLmHMvHd2N18tAaJbHBVhZ/pLtikmLRPFttLradfmg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793998306;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mf95xR8OIyAvK5HfFiOvdKYzUwsJnsioZTKd5rW7VWo=;
	b=0R96D0T1WQVDdg0ahKwFqRhU/+j9KmUgOo123t6dgjyi10Lrby/64sKK/YuZN++xx2zu
	 iM8+rpAWHR/6zBD73gCpaFxSLej+uFTIZ/PN3g7vs/i7RJJfQOwahyHMINLHeYO0MtL0O
	 fgSbkbxcYhevQY7iT9GwAV+8TF3DkFnfgbguilFxEIxuYJK+hQpiMMRyV29xUeVBVCdvb
	 +17qEdW0mMzleanrJWXiKiGe8M6slQuacdT9QHIoeOhjkKiWtcQosOSlOfqFp3slKyi8M
	 6xBenT10at953TWikfPImL8ito2PhZ+fbMDKu5HEUsXLH1GcLabXgBJAhMc6Q8cRiIA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PBJf6DCA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EHjp9Rpx;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 813741F008A1
	for <linux-firmware@kernel.org>; Fri,  6 Nov 2026 20:51:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PBJf6DCA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EHjp9Rpx
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 813741F008A1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6JL9kv106519
	for <linux-firmware@kernel.org>; Fri, 6 Nov 2026 20:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mf95xR8OIyAvK5HfFiOvdKYz
	UwsJnsioZTKd5rW7VWo=; b=PBJf6DCA1XxuA8iuurPiRawEpEiu+s90Cqeh4+Fu
	HJP3QWay2O9iF27VCLpZKlRBDRQahXvz7fK2ZdYrTSA0FqWVFVGw4m4KRFCOBHGd
	yK5YdobCZP6eFN4lf5JZXCmXE/AbfUOO4WGEWHp+WnRdnTXRZ9cGHIP2t3uXxUiN
	STZrS77PyXAeGUYO5Lw3uuDZu+MkVS4EV+UzPgCKB3uxX5vNPkdfhfzfT1ZKPpyy
	P2au5okMBCMo8Si7DnuTpHSkqKLwSjxXIIc2u0hggTs0xuv9nEbEhuMJ8TJreO1R
	HEhb/gRWp9B8zx9+CUK3OfhDz5tLp+aKEu4eSJqxudg85g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmyrga5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 06 Nov 2026 20:51:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-946038e22f5so38257285a.0
        for <linux-firmware@kernel.org>; Fri, 06 Nov 2026 12:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793998303; x=1794603103; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mf95xR8OIyAvK5HfFiOvdKYzUwsJnsioZTKd5rW7VWo=;
        b=EHjp9RpxiGiCL5XIx6nXrX5Ci1cn8ziE3NSfzHlwrodRuAIQn3JNLOeTfWkGt+y07T
         INRlzzYKD6iPeCMb7b+bKjCps9aVtfblu9/Xq/5rAXvou60qzzf6p/Pf680/1/OH+pH3
         HE9YsAExGx+PyQZfPixYlbkOQMQgim0YMD/Vg64heYSVyBDCOciqP3KSoXPYo7aU3dSi
         23wYb/0la0h0UZ6qgq2noZ57IR8t+wIU9NtmJJ44xFBQtS95wciVFIoxgVXj4s/ME14W
         6sBBkTNwbSTWWAHTolGEujGWzg23Q19WnzxoiOBCWsyJ7qHXY2RYcyB++RQ4/7TgdS70
         9Qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793998303; x=1794603103;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mf95xR8OIyAvK5HfFiOvdKYzUwsJnsioZTKd5rW7VWo=;
        b=UZvcreEYDFKAnWgaprufqrKXoKyKDMkY3lwJTQaS8bv58rnc1umikALuyGES7U3Yfk
         8bjPtgBvrvp78ExmI58zPTpVGcDmptesxKuPT3UdZblOXqFf6MHbnnTH4ljvh3OJBFT5
         vL/SXckND9mcUOUERHLzsRBRGyDyXRAXaGFy5/jpigPdDfxJNmMULJpkTCmO41iPE9Zv
         uqGXk99q8e8XStTzUz4rkJD6TG7UwCIb0Nlth0t7VYc/OGeyV32ixEz0GzEX4tjuy1Q7
         LDwtfkfcPvqp0MjRMlVA+nDKqTt8Q8kObPYS4Y/9vgH1L3sLXGiD0f+fb5kroiKnI175
         901Q==
X-Gm-Message-State: APuU4Z/YfwprdjsmhVlEc/fE7yYEhYA409UbntoIxp1SUhilqAT3mt/H
	0G+1eWyCaG/a1fihDciqdIAbSolvyHrBACitlHUzlnINWyd+wPu1GwFOjLMC8USLSnzyeZpJAAb
	XiKOBNsl7I8v33T9x3eC/whOkkn31jButUQ5dCnM6nqcTMUQB5USOjXPNZ9dBg7PnLLdiCXk=
X-Gm-Gg: AYBFou2btcC6BzzAkSYTugDYbuFdUF+c/QeU+fon0vbpmMpvzwHklAEzxTvi0Dh0JQp
	lMP0YQ2BVK//G21v1Mmo5y+2AqhsjuPEkflDl1/SQOzvhhs5DQqEw6nSOV6B952F1/5CAlWad0K
	Qzd7ZvG8atQO0AaZmtbcqXpNQSm9FOLNvVTMj//+KNUrBWQq42XXs4PqQX2V8oL3lpj2X6w1Bjy
	l7JWeCMVGBx4aCTnwrM5GYYl2QLb/PLA4UM7FILWWZO2G3BSEDBcWJwzyViegcop52pRnWNw+D6
	rU5rlMwpcVeDf5xQmEGfpm6bwQqZk9mRu/Etn/LtY+CGZi+NQDIXf9D1ToKTd+wYQM+AobozAlt
	BRSKzXzDFT1Xi5ze5gQh01kaWigxAt8UkuW/PYxCHZ7TdxfkbU+N9C2PTEftqkLSQTTfg1Q9dpc
	/LZzH3+m1thvKYBCGjsOC4hryGLr8wG49XsGMm4Tl3h+Wxw+DXB/f+xwEOaARO
X-Received: by 2002:a05:620a:6f03:b0:93f:61a6:b89 with SMTP id af79cd13be357-945f32f1de0mr557542885a.7.1793998303464;
        Fri, 06 Nov 2026 12:51:43 -0800 (PST)
X-Received: by 2002:a05:620a:6f03:b0:93f:61a6:b89 with SMTP id af79cd13be357-945f32f1de0mr557540185a.7.1793998302987;
        Fri, 06 Nov 2026 12:51:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c0030869c9sm485577e87.63.2026.11.06.12.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:51:41 -0800 (PST)
Date: Fri, 6 Nov 2026 22:51:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: [PULL] qca: dedup QCA USB firmware files
Message-ID: <oqo6fnkxm2hbl4a5vwvivn35f2o2fu43ggdidyuqbghjgdfwsh@u2blubebipa2>
References: <20261105112700.21315-1-dmitry.baryshkov@oss.qualcomm.com>
 <20247457-3e1e-4e59-b297-9e422ddccd55@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20247457-3e1e-4e59-b297-9e422ddccd55@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 2u2CCbY4JqbI7loTjpXIgXhDfEYnRm0m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA4MyBTYWx0ZWRfX9VC8oZbSsaqq
 5LA7vysHMdtvhnZSg60w29WYjHlNdg/ERz+88VNhODi18YqVXcBxZRTpGq/2yHs9MuT6V5+PX8f
 Eo6fzAOnm4jMIUy8OkMUyRYpWEv8UOk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA4MyBTYWx0ZWRfX9zJJobjauNgw
 0ed3HnLHjFEtonc/AE1gc5UnU1zN4lE/wMeI/6PDmtrJK1D/uZkAoIvxIM3Yd4+dUF6vjn5sgnK
 5Ps6BaowFA5tm8LLVwEbphHndva82oaHUoxe9yHNaRP2qExxdPhlr7z5DDEcqEG/pDXLnAvt33y
 rdGAUVvwH5RXuPAG2HxwYUV5Yut7kT+F/h+uf0iMhQRdu2bl3frBekA9Hn9Ya1kZnMKrkKBl3Mh
 LUTKNdak8nubjAHfcd3+rjx8izpR3f1AsQUevx3gH4h0rlJaX5SFkC6TXbEYJ5qH3nnTW2JnaZC
 ORaLuL527atvQBYimaCBJ/MujNXHDxFCLVTJtRMMfKZxf/Ma/wf1I2hAQZZLlnthYdOMmR92vLD
 16Q4QKePJgQc6cswWajJ+0KryhLnuYCrrggktEQIUl4KbjjYJl9PhngzUgIxONYOUh+EN8fK/vN
 m2eM9LAQAC7nm4EOXyQ==
X-Authority-Analysis: v=2.4 cv=V+XoQuni c=1 sm=1 tr=0 ts=6aee3de0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=uDHGxvQnKNDiAXwnnGgA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 2u2CCbY4JqbI7loTjpXIgXhDfEYnRm0m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060083
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 02:07:09PM +0800, Zijun Hu wrote:
> On 11/5/2026 7:26 PM, Dmitry Baryshkov wrote:
> > The following changes since commit 703a4d95f86606b14b8433e7197663874ef89eed:
> > 
> >   Merge branch 'robot/pr-0-1793799659' into 'main' (2026-11-04 16:40:59 +0000)
> > 
> > are available in the Git repository at:
> > 
> >   https://gitlab.com/lumag/linux-firmware.git qcc2072-dedup
> > 
> > for you to fetch changes up to 1308e5fd64510223774218c0d1d681e7bfba40d0:
> > 
> >   qca: QCA61x4 USB: Link 00000201 firmware to the 00000200 files (2026-11-04 21:00:05 +0100)
> > 
> > ----------------------------------------------------------------
> > Dmitry Baryshkov (3):
> 
> Hi Dmitry,
> 
> Thanks for the cleanup.
> 
> For these dedups I'd like links to follow these rules:
> 1. A link file and its target may differ only in the board ID.
> 2. If a board-specific NVM is identical to the default NVM, link it to the default NVM.
> 3. If several board-specific NVMs are identical to each other, link them to the one with the
>  smallest board ID.
> 
> >       qca: QCC2072: Replace duplicate firmware files with links
> Reviewed-by: Zijun Hu zijun.hu@oss.qualcomm.com
> >       qca: QCA61x4 USB: Replace duplicate NVM files with links
> Reviewed-by: Zijun Hu zijun.hu@oss.qualcomm.com

I'll land these two.

> >       qca: QCA61x4 USB: Link 00000201 firmware to the 00000200 files
>   Suggest dropping this commit. 00000200 is for ROME v2.0 and
>   00000201 is for ROME v2.1. They are separate chip revisions and
>   should not share a firmware build ID, so their firmware is usually
>   updated separately.

These files were added in 2015 and never updated since the initial
commit. I'm not sure how your comment is relevant. If there are any
updates which were not posted upstream, then please do.

-- 
With best wishes
Dmitry
