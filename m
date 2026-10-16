Return-Path: <SRS0=O+Bi=IG=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B825CC6B38
	for <linux-firmware@archiver.kernel.org>; Fri, 16 Oct 2026 05:15:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D968B1F000C5; Fri, 16 Oct 2026 05:15:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792127701;
	b=Wx5y3nsJNwV+EU2JhtawHeJBT+OW37yPsCtrlOlrzBaQv2qAFHMTtKVw3B8ITMEeMEjf
	 8o9D1HFaZY2zrfwLEf6Ya3g29fbd8by+a3baSQu6KVyL4dmAghDxaB8eMopgZiZgNFFp3
	 AHFVFKYiAIdvViFDTpq/vcEP3asgJPn9PUD+eqKcJg99Mi0CgC7smSaKMQr9RrxVo9EFi
	 7bbgzdL5DoVKwuS3U0mdlIv2IAh1IGQrXR4YyMov/OiwW902lsV100FP1Jt31WFDIOXpa
	 wf0HqHaeV0DdhhQstNnaMgA8VnQyKYewsBJRMEzvQPorz+XgDr97bG62O54sNMEpcKA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792127701;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FJ8Puxr2J15hTRommE0yks1uMEZSXYDg29yrapFbCIg=;
	b=tjDCKSvQLdEmCQPoxGkr/xyM8Xq6spfXdVas4HbdR2pbO+X83i9+3Ced/04uyfHq3sJW
	 hh2CKwhV6bkuihmS1DNhjVFwy8jQMk8OrJ4l2JExPbHemi+Lt4rtNMNtqlZ6slRb9AVKY
	 W1A62mWxL6lQHewr7Jb9txoTfJImgtPmNToXq6q+afL1z1XkaqRQqhcciuuuEQOVF1I4v
	 1P4z5YI1NR9JRzBC8uwC2lg7aXwtMcsSGdSEKwcHDeIZ7JIgGhiczquoBrl3uNFD+eD8i
	 mhbFAYyY8s+b6ERZMtM6Fl06O3ZrVd4J0ecchNbuAbvBAKghUhxvxWBAKGHGvRFg84Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WI+n7AlK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WSJKlQeV;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2252F1F000C4
	for <linux-firmware@kernel.org>; Fri, 16 Oct 2026 05:15:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WI+n7AlK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WSJKlQeV
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 2252F1F000C4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FLiix44126289
	for <linux-firmware@kernel.org>; Fri, 16 Oct 2026 05:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FJ8Puxr2J15hTRommE0yks
	1uMEZSXYDg29yrapFbCIg=; b=WI+n7AlKHv55UH6W/bvC5coLlUdQPvR5yfaVRx
	o7GT01USg72jSe/ix7vG5sgLy0/erXfyup9RkT2WYiPs9UdDJiuvK74MG3BWoIt/
	NtC4qROX8+VJdqsyJHw+gr2K9kGFOW1d42IsCATOFdQzAlXJzahFdvAPYGMXwaEo
	mH14JkMPAzMbk6InVRbWuE/oBi4qiKyqV9bqtqW7vUlHWxTvJqnrO6gjUJ8qbbd7
	OyGbBi039/CTgDpytCfq5LNk3bJNNdcOswldxbWICYqZO/WgWMVLzmczxJnkdJNx
	RNzSPL7MlfgkvsbFEVM5c+ElkSFAPmr4o2Sj4AIbdikICRAg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m2t9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 16 Oct 2026 05:14:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c5aef2a74so7322355eec.0
        for <linux-firmware@kernel.org>; Thu, 15 Oct 2026 22:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792127699; x=1792732499; darn=kernel.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FJ8Puxr2J15hTRommE0yks1uMEZSXYDg29yrapFbCIg=;
        b=WSJKlQeVIPZdgUsNJ2xKe0gfYKLBkM0n/4Wvhfts0xXbMyZMMjcnZHBd2mVfyrSqBa
         sV1Z9xwVYd9zg3xMWbDqPdMA2HvIjNpT1VWkow70T7YfbksWDgiuguZcXYEl0tjWG8kM
         9vtNBAfSlM46vMevwFB8a1cHi0+1PNVVDeMtHlmsyGX9L0ya7AivoHaX6PRDzgXVdk0a
         P08vYOG2Ams7fP8gYewCNsCav0qo/YR7syUNHstWlZNzCjtbgfT3XVSMbi8X57VCYEgs
         X59av80Yhhjl4hgrwjQyKxInWJ2NLyHe7G+B7vtZs1egf3OKYtz4ipBA5TP6YbfskY/n
         pwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792127699; x=1792732499;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJ8Puxr2J15hTRommE0yks1uMEZSXYDg29yrapFbCIg=;
        b=zqZsmNDUiVixfE7J6rGYJiOn42E1tQTqC2qvfI5VMiCySJggpVCOkzHvvOPhCFfxsL
         EudHiO8NDJLuzJd6p/ueCBCr589wrJLaQ8kgqLb0i3bjv1qxvjfQ637sHM8AIoTNiM0Z
         oV8ZmdSadUSr9Z70TCkek9BbOWjLxLnVCMHuHIEsNXaUa3lB5rkD04WvTDVjtEneZglQ
         PEVC94rvtXRW6/xuK3m5HubsJPzf168MDcIQeYBEHWmQSSGtCAIyqY2aqb4PU/++0z3G
         R7j0KYI3K6xOIqjF3jXSdzl41rpGVQHMoDsONyW5TTCc+byL7RsyX6GbIsOBmlgTbUWN
         Y9uA==
X-Gm-Message-State: AFq9FYK6kyFj6H/dV8SbuBRja49EuhSxpvh2T8fuUJULAt8jbQdOiScJ
	gBGjCHjCKSvd4uy5mnBAIj6KXFsl2xL/pFnws6/nU+TsATwJ3NmUq+R0laCfRvtDHREidxUmZs9
	SD1JfvF2GCOKmdPNSeGX/pIIq39g5322zQdkTnhKN7kpmpeiYDbFPY0GpZiZ4+7WKuI7GpRw=
X-Gm-Gg: AYBFou3aFqjaxxLBSyq1dtHBG3QOwFXg1XIR0HbaRbf1FgMwQjkXUgnT2BTJhtWSkYU
	Ovo0+hPQHCAMfE/3Dj5wF2esG0wCXXwIH2aV7kgYNDnbx9WGE8WLuIqN1QwpN2u9HLjYjitVXQc
	sa2YdTc405YZ+rOrVoazP2oQP15XLB2b7rCfCQv0CkHKdXAfVPjs9m0RlfCDmRqDW9r6GgpkJej
	tKH2XclTRU2mhm4+GqajWLUyhINYC4o2/we17UGwLL8EPhAjozpchyI4Ui6WCvjp5VuW8RBOkbe
	F4SAUBTEXY9F5BDzO7LhtXGqRK6ZzvAP2XYRT6RrkzOjZaBIhKIz0Emp/Wb3Hk1QwrAvndCgfo2
	zxlzhFvOZczfDFp+G2/mS9szy4thT
X-Received: by 2002:a05:7300:c8cb:b0:35f:f4c3:6403 with SMTP id 5a478bee46e88-35ff4d2b879mr3697378eec.36.1792127698606;
        Thu, 15 Oct 2026 22:14:58 -0700 (PDT)
X-Received: by 2002:a05:7300:c8cb:b0:35f:f4c3:6403 with SMTP id 5a478bee46e88-35ff4d2b879mr3697351eec.36.1792127697933;
        Thu, 15 Oct 2026 22:14:57 -0700 (PDT)
Received: from [10.219.57.13] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081ab80f9sm4580299eec.12.2026.10.15.22.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 22:14:57 -0700 (PDT)
Message-ID: <2d2cae60-fb47-480b-900a-a2eed5f5fa5c@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:44:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: Update ADSP firmware for Qualcomm qcs615 platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad1b2d3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=qC_FGOx9AAAA:8 a=un1wO3BXqfsl9ZcMhfIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: IzzqAlZCKe25NSLjINwEsk59MlFEgaVM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyMCBTYWx0ZWRfX+dVm7VXayOmA
 CMytNw5QS8/EJB8AbY6mqsxja2/IBEfl2ZkOg/J7eK0yP3PVIF+U3HFtgr+zYP2W0cMoq2gIar2
 tkaudzaoYDYeDr+Ru34kUxJAzI75pBk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyMCBTYWx0ZWRfX3ajt+HbyshqI
 SCJZcMnmpjbM7loJ+s0HQIntLsEHK9Kb9eyyLEpRkb8x5Ch0l5RszqJbnIIRqUFlcVt9X+nZJB5
 eIVlRgOeUNjDpVpRwmfqDVz/VUNu7VUkSA0GQtz6p28AtbC6CA2+u6PIoe6uzxRWVKVbouqR5wY
 nhWwJmYM3wSFk8mYPgg9gzGeiD0mAwfizs1mvTOg1sWyjjZqyRxLC43occDMcdTv/LzBv3VYBZ3
 0tv5f+TWDeyNSU70vVOjUWF+bX4KFNU6D+KTQcb3du+HaCfRXOaZoYyFbMMuT8SfeflJjF05VLo
 LTtnV/IBpPWJ23aGrEnJEVDaonhGCQlPr7DUIO2GcH9SkeZYydZSTfh0c20EJZlN+JU9LeNspBi
 3+QgXCCClMmKIil7QYllS0/DDfvtunEBR9iE4R5AelYMzA+YafAkvrf/bRdkSGcEBlqUy4o0htC
 /dij0x4le/QPWJGbkMg==
X-Proofpoint-GUID: IzzqAlZCKe25NSLjINwEsk59MlFEgaVM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160020

The following changes since commit 38c1a7096dfb2188f55f342b835f14c362c59409:

   Merge branch 'amd-staging' into 'main' (2026-10-16 02:31:45 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
qli-dspfw-talos

for you to fetch changes up to bada67dfbcb4faf1df951ceaf6087b4b6ce2fe4c:

   Update ADSP firmware for Qualcomm qcs615 platform. (2026-10-16 
10:39:37 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       Update ADSP firmware for Qualcomm qcs615 platform.

  WHENCE               |   2 +-
  qcom/qcs615/adsp.mbn | Bin 8532108 -> 8532108 bytes
  2 files changed, 1 insertion(+), 1 deletion(-)
