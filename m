Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7CC606A31B
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Nov 2026 16:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HcUBrPRb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hzFhLXjr
Received: by smtp.kernel.org (Postfix)
	id 68A7C1F00919; Wed,  4 Nov 2026 16:33:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793810033;
	b=H7HX2TH4ZOMG/ftxsnX3QoLZThB1J6DyJEgw4jTVe7VuF2p4moVzacEtzXG8VAh0S6DJ
	 4UU4a9gxwB0kXOi7ot6gEdp79YuwPZ81VNlAYmSEQh9qFf4J36qR/Wesu6OEGGRvBt5ip
	 fIG5TgKJV7y7T5+l7+xeU0mXMS6i2w3rz8JvuDD8tLA3+pePF2tE9V+fTb09+RKqmir1Q
	 eBJqVWInaTfRj+A/+AbTfZN5lSULRJxnUouAmr0DxOQmBSspZrpy1ibqzu98/9y9tZpBE
	 xvJ1d29yeNjMyW1HtvMl571lImXQ6n+WfNHWh+d3WSHfbWjTL4XSBvEgpxPHkSwcLFw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793810033;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DKq1DZjMaFV7mL7s72b6+jm6pdesvuJhU3kmoktXMmA=;
	b=DA3DzykJ7Hg+L6b/nLIAMZBNon4jYinN/5xZESnDY+D4xNwlSi5b/rl3mZb3etbD8QAT
	 4uWJkQuF3MnWY5aBZ0IZrqdOkJcTVGEeqvQ8oSuALmQbATy352zb4rrxvGxYfOtB/I+ni
	 +kvYXfTT5coGWCnhmxcABqKABY0C1JaHzyElFhPvsL6JPXsw4HyiI1ObP9OH8M05JyIPN
	 buKjlsKihef+h63lIgN9/3Ai3UYqXBa3zb+gSIAfELnhyAplgy+QHyM2n5tlU+o/RAPCB
	 uT4KuEwA7554TsolsfpcL5LOiEhrsdUf5C4wQG4vhXgw7GNHcoryZ+dfplPujpqX8bA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HcUBrPRb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hzFhLXjr;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A4C461F000C1
	for <linux-firmware@kernel.org>; Wed,  4 Nov 2026 16:33:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HcUBrPRb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hzFhLXjr
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A4C461F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Fj61N1149186
	for <linux-firmware@kernel.org>; Wed, 4 Nov 2026 16:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DKq1DZjMaFV7mL7s72b6+jm6
	pdesvuJhU3kmoktXMmA=; b=HcUBrPRbXr0aZ6xWiqDWBEW8b0DMa8TPnV2iLpC6
	Cznk+obHJOP6LkliqWtZbsDbGB+u0DvelavZ7p9GsR/gNmmCv71hgUNp7+d0NecO
	MT1vgtyLRlAUSxTSYgDN/CnRPGCAp1ImeyeW30ToqoYf9KPUYZHjQizBLiV1jElc
	3JqZLjxz0cXz+Imj7eJqDFio2b1D16+qMGSMoZ2A1l5ZZvJqcNXFvjBiO5cJep4w
	saedajRcph5gGsH7yWRbE+4WGWABZMrOdx5/Hre1mwTbwxqho97Qul4+wV+q0A1C
	i4O1kVWtfBRzqxBd5VqlxaO23PeBHFUcrIiQvA0P9PDqGg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3r8184d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 04 Nov 2026 16:33:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so182041085a.3
        for <linux-firmware@kernel.org>; Wed, 04 Nov 2026 08:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793810030; x=1794414830; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DKq1DZjMaFV7mL7s72b6+jm6pdesvuJhU3kmoktXMmA=;
        b=hzFhLXjrrM8XaPEIy2iNJaMZTogwWLsURQAz0F0Id3n15YJPfb4We1ls0U27FJKBYJ
         wGsTmSI0nTKscMKyomQeW/t5gGVsTi5fS8hIAS2MJI9mybkLI8UCdCv8+x/ASxcz3TBm
         EY125Hq816kouemXkubt4BmBBIw+AWNcvHAbhInYqSWcQb+LaaPJqmTJ4v4O2hEmKGLU
         EKkoImTiqXtTD1ES1n6rI7S9MSjQTGkeIDrUikAjnNNYdcNRpRGvQfmwPGI+pj63uQ7W
         Z8OSacECF3+OxZy4/zFbt5aonRZ2zY563NaSDxirLryxHiBe8ZYh2js21AjOYkcV1VPG
         NBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810030; x=1794414830;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKq1DZjMaFV7mL7s72b6+jm6pdesvuJhU3kmoktXMmA=;
        b=R0WXU+uiA2Tx6jYSN0ECwxcsJx5ygZ3tyBYB3WsbDKuXY8Ml9UYmkZ5dk1Rc10Zkvz
         ehwM7Xpj3OcvBxKweRfAik5Qrrorf3/E8DELqTUxwM+1vCGqkdCwwAwYoyv9lqCfBEyd
         gLQSL7ybowN9X/ekV1LR1AQGwga80ihjaT6UQeN7ckxadxB8g+Oz5WArgpSOQdmnIjSw
         K+m7q9HPcRJ7Mh/o6OAIFd4jgOAeU5EW/l/NIo7jlYFgl0KYUILM0XCwZwviQO5Rworf
         zD4wdUivlngIr0pDNHiSDKyN858Su0UYss5bhRlTRMulZKXKik1TiYnu2X4TrbhrxSE7
         tHoQ==
X-Gm-Message-State: APuU4Z8hvfd4tpZusYz9Ir2+2qzbqlYM65VhcGLJy8x2E1jxxU2stnZV
	hwo2xYoGmpBZIT014uRjobcpXWqPhf/rXoxQAjnZiQCvtScCMfj1N3moZ20ow1WoMCr5s07Jy7R
	k+5CudoOGi4VMKx/bqLEfhegVw+r6Px7rsxoLuPZs9TT/nJOrIheX9V9uPJGSyE7KM9UkfiU=
X-Gm-Gg: AYBFou1OhY0X/mkPstNgNNzI7Vbz4jVUNrS5zzFpF1j9pmtECYZFq+mpgU8CsttiW4d
	go82xbpuimwrbieASOp9KnO6S3XDPzhmki4cjSZVi0A1jxppX0mg7HZGJ6QuwJfsfdBW3sAql7M
	KHBobKO2C+ahPnVXKWHHNrreXFw8cfqALLpWwKOtyqYxwBfqlAOCAHyf8hKot9NBVwr+YOI0nWE
	QG+7GxQ+niwNi/XLB7UO85pwo/LRhOm5otLRawZHlhXHgTJYza17p6YHBEgGlFu405Nq59i13hV
	az7+eQWcAsG84EYSat9vDBiFw+cnIMlGEZOX51Rn51LBRsU3SndRL7BjvFHI/ZpDXQS3rhaIGbz
	ExavUu7HnHUnc0JLXPf9D425dB53o3R5agRkTn9ZhiGnR9q0x5qqdIn74oIiSZJy9A1X9Nj1Jay
	3qRNCGOyWA3NQ0ak5g3gpZXZ1cXNE/9Grq8TfNdgmijod4HKI/cI0ImcsTTFvc
X-Received: by 2002:a05:620a:648b:b0:93f:2ab9:729e with SMTP id af79cd13be357-9442161877cmr2921560585a.21.1793810029993;
        Wed, 04 Nov 2026 08:33:49 -0800 (PST)
X-Received: by 2002:a05:620a:648b:b0:93f:2ab9:729e with SMTP id af79cd13be357-9442161877cmr2921554785a.21.1793810029351;
        Wed, 04 Nov 2026 08:33:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38ab86csm444701e87.25.2026.11.04.08.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:33:48 -0800 (PST)
Date: Wed, 4 Nov 2026 18:33:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
Subject: Re: [GIT PULL] Bluetooth firmware for Qualcomm QCC2072
Message-ID: <lb2aeexrwkfy5b6ox6mvnyhlqczamdg7rwgpikiwkvvnymalpa@fuscicfhrtih>
References: <26c5ed05-8ba0-4747-8c0e-d8c69cd6b012@oss.qualcomm.com>
 <rajdpyhbx63h33qhkigxlyv6lj4gk457vskutcb26zefagp6be@oabi36e6xjb6>
 <7897eddb-023f-4538-86d7-f2aa57bbe2c1@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7897eddb-023f-4538-86d7-f2aa57bbe2c1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: jDRN1Q38lYzR9hAqqDrK-lHFqos766PL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NSBTYWx0ZWRfX0K6CPsbs7NNo
 hpjkXOHfZZXintcEfjpTagp85xeJK4k4Mu0dgQFQ8VlAbZBFeXTnwRFhXZswutmaaD4hnQk0jh0
 y1MLCq+nRi1NPZQ6wYh4ZT6bt7T6+cnUwkVvhvNafjaJB1SCgVccG/7RImRupIie9wo7Xs7g6ck
 CHbb9KTSl1k2jj/8Oc/V4Mc76vJ2yuYeCFVw+UmhnRm6iGw0WwiDBILmrMDzptBavGjgXXwtsrt
 JjFjWDW4+007J2IcSl+mF/xI/vqluKWsRGA0enrg3AHEXIcLBSAGUQXf3ns8UgQbRsMqLIOi9zZ
 3OhKs03u2WQokMaDRlOqzaqV+qB23R0ZaoqUMy9JnoBCQ7S1C14wtV6X4E7hYdsGBz9nj5Q2NEp
 rb5xmiyYHqi4WUbefDdymX8ZsIBaCljY+wGyB82wgXrmYNRQC8ljhKFm42Ak7IdT02ntXdL70Pa
 NmwxaL4HRTU0/TanVJA==
X-Proofpoint-GUID: jDRN1Q38lYzR9hAqqDrK-lHFqos766PL
X-Authority-Analysis: v=2.4 cv=UuP2pOwB c=1 sm=1 tr=0 ts=6aeb5e6e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=Gt_0BYjMAFmV3KJHCOUA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NSBTYWx0ZWRfX8qL/u06gXdUs
 wPFwrUDVektNntv+t8J0GAtYthilbo8ussgxSkd2127cFI9vYc24gGybOKRMMjn5wh1rLKgMVYg
 otilCkrOiOVR1V9CqR6HzrW4c6Qv7K4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040065
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 10:49:52PM +0800, Zijun Hu wrote:
> On 11/4/2026 10:07 PM, Dmitry Baryshkov wrote:
> >>  qca/QCC2072/nvm_usb_00200101_0201.bin     | Bin 0 -> 11006 bytes
> >>  qca/QCC2072/nvm_usb_00200101_0601.bin     | Bin 0 -> 11006 bytes
> >>  qca/QCC2072/nvm_usb_00200101_0604.bin     | Bin 0 -> 11006 bytes
> >>  qca/QCC2072/nvm_usb_00200101_0605.bin     | Bin 0 -> 11006 bytes
> >>  qca/QCC2072/nvm_usb_00200101_0606.bin     | Bin 0 -> 10990 bytes
> > Separate commits, please.
> > 
> 
> Would it be acceptable to keep the PERI and BT firmware in one commit
> for the following reasons?
> 
> 1) PERI is not an independent functional subsystem; it services the
>    Bluetooth function unit.
> 
> 2) The firmware team releases PERI and BT firmware as a tightly coupled set

OK

> 
> >>  qca/QCC2072/perinvm_usb_00220100.bin      | Bin 0 -> 498 bytes
> >>  qca/QCC2072/perinvm_usb_00220100_0002.bin | Bin 0 -> 498 bytes
> >>  qca/QCC2072/perinvm_usb_00220100_0006.bin | Bin 0 -> 498 bytes
> >>  qca/QCC2072/perinvm_usb_00220100_0008.bin | Bin 0 -> 498 bytes
> >>  qca/QCC2072/perinvm_usb_00220100_000f.bin | Bin 0 -> 498 bytes
> >>  qca/QCC2072/perinvm_usb_00220100_0011.bin | Bin 0 -> 498 bytes
> >>  qca/QCC2072/perinvm_usb_00220100_0013.bin | Bin 0 -> 498 bytes
> >>  qca/QCC2072/perinvm_usb_00220100_001e.bin | Bin 0 -> 498 bytes
> >>  qca/QCC2072/perinvm_usb_00220100_001f.bin | Bin 0 -> 498 bytes
> >>  qca/QCC2072/perinvm_usb_00220100_0021.bin | Bin 0 -> 498 bytes
> >>  qca/QCC2072/perinvm_usb_00220100_0022.bin | Bin 0 -> 498 bytes
> >>  qca/QCC2072/perinvm_usb_00220100_0201.bin | Bin 0 -> 498 bytes
> >>  qca/QCC2072/perinvm_usb_00220100_0601.bin | Bin 0 -> 498 bytes
> >>  qca/QCC2072/perinvm_usb_00220100_0604.bin | Bin 0 -> 498 bytes
> >>  qca/QCC2072/perinvm_usb_00220100_0605.bin | Bin 0 -> 498 bytes
> >>  qca/QCC2072/perinvm_usb_00220100_0606.bin | Bin 0 -> 498 bytes
> > I don't see a corresponding patch on linux-bluetooth ML. Could you
> > please point it out?
> 
> The corresponding QCC2072 btusb support is already in kernel mainline:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3669487308f87d1e6550cf6d5613ea171bad1181

Thanks for the pointer.

-- 
With best wishes
Dmitry
