Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E202606A32E
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Nov 2026 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iMy9yCQm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DNi7R0Wt
Received: by smtp.kernel.org (Postfix)
	id 501A11F00A17; Wed,  4 Nov 2026 14:49:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793803799;
	b=VbpIsUirVUjdA9LiogU1VYZr7dTeBIvJlzMxDaQtbKHa+LhSmpCNLlQDwls8Ou3m0F4F
	 PTuyeScaYV0Yu1b7stXrf13f+o+2eAiyhsm4ZPGtJcb/mHrVgzim/9PZziUFg5ucF0YNB
	 9+AIn5Rl+b58ZZiGct1ivwlSvKUKMm3lp3m3+YthabbjxiyyAKflw1eh4IAmF3cmhtG1D
	 BOkaVKsxHGQpE3EsfF7tzhjJNUf+e1P0Gr/uxtFL+VzEuMl9wWtfWjQ0f6dMXhmTiK9MP
	 nB5WEi6g/Z1u2w/Lsxss7NEMPVr4Gj6AOiAtFAMK6wJyslaOQb/4jcFJcX0xWIsZdhg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793803799;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7pAH9LFBFgTioKdH3LGApcMiSlwAzyez+WYFXGcd8xU=;
	b=B0myuo167BW1DPMQYz85Ohf14vNAtHImqLE54nc2tRwVQLl6Mcbx+AkCjl15eZf6EVI+
	 /hAB4J5X9G74DlJ38K3Kn+qGYVcZ/eZQWZzs8R/SNz03NuvJxhQpyyL5S4MsmpjLFZ3ny
	 UCRTiPTEfIKXZq1RcE/6+P2dmAsBL7gGF4ah//D8j56/P+XPXMdO0iznN6R+XEfJPJ/ic
	 aJr9Lff5KzszngbCI4GJNyhcWMophDQkZeCx0ivs+rn5qbngMzHGqG+HIGyP59NtwQ60f
	 TxZTAmevlUqgtT/WEiWk457id47ZgZDNDE/Ytv5ci/ljskI0R2DXYdVOCrk2xA2UM0g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iMy9yCQm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DNi7R0Wt;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9BC7B1F00919
	for <linux-firmware@kernel.org>; Wed,  4 Nov 2026 14:49:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iMy9yCQm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DNi7R0Wt
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 9BC7B1F00919
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba4qF609434
	for <linux-firmware@kernel.org>; Wed, 4 Nov 2026 14:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7pAH9LFBFgTioKdH3LGApcMiSlwAzyez+WYFXGcd8xU=; b=iMy9yCQmCJ1Tdynj
	WETw/FY+AmCxGlthp8mrCcy7oATmj+4y6sdY4KO99cO87HxxTVlx/yuG5rXxIEig
	6NMaExYZtXY+VkGuf33L45oSo5Bl2hBVMz9/G5vyLNlxCJrHrfqFIzpbOxkFlAqv
	8aNxK0k1zntHGrNwdcbSEEqt4c3bkqIvTyUSMDM12nswlExyyVStJ8IEMAjTKzLy
	q79U5Mon0psghLpA+fFrYpWS8RBQ2xvgk+AKe0ThJNPsT/CNQNctuxVyexclPfM4
	u/GMI8FZATGbshv4wuz+Rnth0fEQq3N+Vq1tirFg/mYnzvihCKE/GfaoZbMfNz0V
	JorolQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3r80sbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 04 Nov 2026 14:49:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed130df875so928985ad.1
        for <linux-firmware@kernel.org>; Wed, 04 Nov 2026 06:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793803796; x=1794408596; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7pAH9LFBFgTioKdH3LGApcMiSlwAzyez+WYFXGcd8xU=;
        b=DNi7R0Wt9qaRvFKZTMthJKp/4V+QOKAsAXKZXj13zrtf0Yt+6xu3IBaRSiEDSto4uf
         m8I8ihyx+59UGYDUZv/aqfHoR+8pN0Fa8fCPp79KI0RmYAbZf7NzJU5TQIXPNrnBzjhg
         VZY1QLDNgBelCeGR5eVVwVoCvuLP8EU7Jj39sWYjKRaMjjHxSkWpDeIH+sJH4q+QwaVE
         2tToQUQ9Thp3TQBvr9/W10vttWoBgclVPb85LlBkH5YcX3c57DcH+dhPJlc76WnFSCZr
         Wb0yEi4VT+QwSNEnaGE/5KECdRuZPIa7Npkm6mu15+cjpe/Z7t5dc67jcqvmgOBwmihz
         +1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803796; x=1794408596;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7pAH9LFBFgTioKdH3LGApcMiSlwAzyez+WYFXGcd8xU=;
        b=0xqFTcS23C2aNSGvx9DsS7LurgQhgI7ffawSKUkHQ9363z3f8yx7C75zFfS84mWUi4
         CeuBZ2fn01QZz0oB1Rp3vR7HcJGr445++rbKdORKdVk7FaOghyx3ilb9nbB8VzLKVMvt
         B6vSp9lwuP/qIK6Rf5ELQHWxnRPjzK0V8q70U3en1KSRub/A4RMLQNpEkg9NEKqwaPEV
         JUtLE0nQF1iFC2poOTm9ac0MOoX7vQRDCZmilDhP/sNCvhcWcm9+VdSq0jTkG3fUlXHb
         hV3+Ztu7oqstOXUefSwni/aPthsyhhGGpTFnOD2HgzR5Ygu/+waBzLVmN8yQVUcrwitt
         DSPQ==
X-Gm-Message-State: APuU4Z/zKtz7tw9VqbeM6PoYJCFCHLdqyjfT27LlTgeTHRwdCpLl7SQ9
	8pBg3fCSGAZuPoPLL32cjCH2E8HdZaxLLh8W8grgc4PuznSUMscFeumsQ2vhtBzhqAGJLMtKqXt
	EzdkV1yCXgyuCmDo8MKrP/9Z/5Tyno8SENZnn087I6YkMnDS5CSWM6DPjzW75b9qk69D5RXKfuw
	==
X-Gm-Gg: AYBFou02yQMdiDqYai3e3oOro236wyJLTzJoO3p4iDo4QymR0xSzF05b6L7XDe793xj
	jEwommezWrYoCOQUUO7Q1aEJ7OXi2H3p4Y+a3NKGa+gTmyzdQ5EV7dBklC+qAXEO6LgW2fYLKE6
	MA3WRruRkid5gk9MPRUBz1/EwZI2nb83VkCFtPrWwkIy2SYlEL0iZT5XkIfM6b4g0fIUPSLv6q+
	+TtBXnnOFd5WRiC7Fz94eyJwduvSIpfWJpwfh+ktcFa0fvGnjSWkapE1Ua43n/VTV30ALZ1i9qL
	uQpwXQ2oA6Yh/KbusnIOCmqpcasw2xT99zPoryoFDM3VRHqwXyTVuL0nj9VrsUtwe7mPhDb9El9
	1OSvLohl+Lj0Y8LRbUT5+o/LPxvlyivngKqS6dU81JhvUs64LIW10sDXVMWr111r5Ot7qJEavtj
	qSAjWAePuRts8A2vNO+Q0blm9tdVyY4LMsHiDo+Q==
X-Received: by 2002:a17:903:388b:b0:2e9:5714:607a with SMTP id d9443c01a7336-2eb3641d0edmr262812425ad.2.1793803796252;
        Wed, 04 Nov 2026 06:49:56 -0800 (PST)
X-Received: by 2002:a17:903:388b:b0:2e9:5714:607a with SMTP id d9443c01a7336-2eb3641d0edmr262811835ad.2.1793803795690;
        Wed, 04 Nov 2026 06:49:55 -0800 (PST)
Received: from [10.249.29.146] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed0909e543sm8482965ad.39.2026.11.04.06.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 06:49:55 -0800 (PST)
Message-ID: <7897eddb-023f-4538-86d7-f2aa57bbe2c1@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 22:49:52 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Bluetooth firmware for Qualcomm QCC2072
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
References: <26c5ed05-8ba0-4747-8c0e-d8c69cd6b012@oss.qualcomm.com>
 <rajdpyhbx63h33qhkigxlyv6lj4gk457vskutcb26zefagp6be@oabi36e6xjb6>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <rajdpyhbx63h33qhkigxlyv6lj4gk457vskutcb26zefagp6be@oabi36e6xjb6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CAqEOBCgoVTl-zIeA4jBUt6HKnqXI4p0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1OCBTYWx0ZWRfXy7xx5gAER3/e
 /e1jSofdu57MAArpBgKpIkeabNKxXC4uNoasXWOgL+kR6lp8iHrqB2OMqQlhrdvJhZfrIQaLuHT
 hiAzXacu3gF3xrWavuaj9N2myPgUdfJAMhtAjib69LAIHc0aMrwyDJmHPkBhl+eKrYdp7bV+WZ/
 Ld5F61yNiIIOY/O2AQqiAVsxvsar4k1zYJZ88usbQSdWvzu1PxCsAWlJcLqzXVaexR938SPFZ32
 +t/+YX67zqPjj6fPubatsryqGaMHZRfnwm9Tk0BXnZyAUQKD+HPoEagfr5H8DSVfTFXbHALimb7
 iwMesAeWzZya9sKa0khkZelu5MLBKUVC2etPyYw3fKo74tTZmPqnYGd7g+vTv8ThyieyAzFHuiE
 dLyuC+oQTZXK+iTe1bcIgE7vIJwlc54ZainKUELfU6ztVtfoEmpT8975gGugB4zMRe5J2a2EDC/
 VQGWkzEg/DrxIbvh0dQ==
X-Proofpoint-GUID: CAqEOBCgoVTl-zIeA4jBUt6HKnqXI4p0
X-Authority-Analysis: v=2.4 cv=UuP2pOwB c=1 sm=1 tr=0 ts=6aeb4615 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=j0KuPzpP5xCITzCDzuYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1OCBTYWx0ZWRfX6+QH0brFlvUQ
 nSFPeglKRJWKeSRMjx54K208gqF8FOl0b2MQYS+LPSDWluG6v57DQELvG+y8tkmPMjFDJdipe++
 zm6uh1Oo9AkC7KMQ9TKPIeh9mHiiPHo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040058
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/4/2026 10:07 PM, Dmitry Baryshkov wrote:
>>  qca/QCC2072/nvm_usb_00200101_0201.bin     | Bin 0 -> 11006 bytes
>>  qca/QCC2072/nvm_usb_00200101_0601.bin     | Bin 0 -> 11006 bytes
>>  qca/QCC2072/nvm_usb_00200101_0604.bin     | Bin 0 -> 11006 bytes
>>  qca/QCC2072/nvm_usb_00200101_0605.bin     | Bin 0 -> 11006 bytes
>>  qca/QCC2072/nvm_usb_00200101_0606.bin     | Bin 0 -> 10990 bytes
> Separate commits, please.
> 

Would it be acceptable to keep the PERI and BT firmware in one commit
for the following reasons?

1) PERI is not an independent functional subsystem; it services the
   Bluetooth function unit.

2) The firmware team releases PERI and BT firmware as a tightly coupled set

>>  qca/QCC2072/perinvm_usb_00220100.bin      | Bin 0 -> 498 bytes
>>  qca/QCC2072/perinvm_usb_00220100_0002.bin | Bin 0 -> 498 bytes
>>  qca/QCC2072/perinvm_usb_00220100_0006.bin | Bin 0 -> 498 bytes
>>  qca/QCC2072/perinvm_usb_00220100_0008.bin | Bin 0 -> 498 bytes
>>  qca/QCC2072/perinvm_usb_00220100_000f.bin | Bin 0 -> 498 bytes
>>  qca/QCC2072/perinvm_usb_00220100_0011.bin | Bin 0 -> 498 bytes
>>  qca/QCC2072/perinvm_usb_00220100_0013.bin | Bin 0 -> 498 bytes
>>  qca/QCC2072/perinvm_usb_00220100_001e.bin | Bin 0 -> 498 bytes
>>  qca/QCC2072/perinvm_usb_00220100_001f.bin | Bin 0 -> 498 bytes
>>  qca/QCC2072/perinvm_usb_00220100_0021.bin | Bin 0 -> 498 bytes
>>  qca/QCC2072/perinvm_usb_00220100_0022.bin | Bin 0 -> 498 bytes
>>  qca/QCC2072/perinvm_usb_00220100_0201.bin | Bin 0 -> 498 bytes
>>  qca/QCC2072/perinvm_usb_00220100_0601.bin | Bin 0 -> 498 bytes
>>  qca/QCC2072/perinvm_usb_00220100_0604.bin | Bin 0 -> 498 bytes
>>  qca/QCC2072/perinvm_usb_00220100_0605.bin | Bin 0 -> 498 bytes
>>  qca/QCC2072/perinvm_usb_00220100_0606.bin | Bin 0 -> 498 bytes
> I don't see a corresponding patch on linux-bluetooth ML. Could you
> please point it out?

The corresponding QCC2072 btusb support is already in kernel mainline:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3669487308f87d1e6550cf6d5613ea171bad1181

