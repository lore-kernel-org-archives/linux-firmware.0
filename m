Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5C7606A326
	for <linux-firmware@archiver.kernel.org>; Fri,  6 Nov 2026 06:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pe5m2rko;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CTUao0sQ
Received: by smtp.kernel.org (Postfix)
	id 6B44B1F008A2; Fri,  6 Nov 2026 06:10:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793945446;
	b=pnkOmaFkq2uqHgob0KbwNLWDkd02kGHdofo5OXNKxMFp1LHbby6TNElsJ+86VPzFVIuD
	 6fwOyC++AXSRmlSbbBaTKTJs50CXki4kqB0EVwzAtEpmB+NVI/MnUsWpnKB0udyW68S6c
	 7i1blPtACBDZCBzclqNmAm3hYetI6GaTeRaA2+9ucJGxY/PQnOo304DhOTxa7zwJgmFot
	 I05BPlroI7dzW5GDngasUr4vjE7Q8b7ru2Q1tUB/PsCdY/vaNCDs5983/BfA6BFEcbDBN
	 aWxBKGsDV5LrgD/RmUgspX0yVFclSblEQHdkuawrsust7caoNlACJ5qKJ1X7wxMmK9A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793945446;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MUo4E2DO+FYhAy9i51929+r6hBXKgVANxqNcwu4qVo4=;
	b=Cpfg+5QC0xeO+yeoQ7F9CZwyn2LNWV6f1wQ1k3NfjxonB6lCCiwAhU3RzO4Y85hwMtDI
	 XV40a1yY8jcf/ns8myTPT1S7RAsCW5jHK7m127B5IILBPKsXUkACwjgMVg4NqxWj0NOyC
	 lkquXsCJVDnaPr00+XpPEYanibpHZZt8eMWmq79S4wCF49UFRXzj8ZPpjXP3/1hC7hONf
	 nXGcmEkcRyNClv8PCwFcb0AMQeLenrk3JIwwWKIoMXaCiKUXW+tptHT1QY6pk1VWSjBoQ
	 FHMd3LIPhRd0fdkRU39NjvOlaMrFuTVyG1R9y11aqOt0rp7+Bu0pogIPlyTR8SQEKEQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pe5m2rko;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CTUao0sQ;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 45D131F0089F
	for <linux-firmware@kernel.org>; Fri,  6 Nov 2026 06:10:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pe5m2rko;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CTUao0sQ
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 45D131F0089F
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A640Mwn2817900
	for <linux-firmware@kernel.org>; Fri, 6 Nov 2026 06:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MUo4E2DO+FYhAy9i51929+r6hBXKgVANxqNcwu4qVo4=; b=Pe5m2rkoulisaAgQ
	MUf+NgLtOB2M0+V+tz5OAJTLXjN95/IELA8hpgJVS8yNWmk9ovmu+CaCz38yS3oI
	thFB0IOexKD4oOuIlXMse0RGgFsox3jFIl1y20G/0IkjMhXb9P3Vq4ZRMP0JOR7W
	K1xfSx443MW4eb0K+7xz7ht5MjqNRP8HcMmaBM8KpgBhcQRVLK6YnbK5AgcUhTHV
	0Qe/xjVDtCuoi0LxoaSZnk9ZYFl8woyhkMnsyd0bonP51p8yZPEU+0G5cJ+iKQCF
	SP/PnMoikEsovWM3fFPqej2O41ODTLEVFOpHkOCOHoJPpYe2x/PJiq1kZ6Od1+Ti
	SEr7uw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa16x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 06 Nov 2026 06:10:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac94f8df66so68935a91.2
        for <linux-firmware@kernel.org>; Thu, 05 Nov 2026 22:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793945443; x=1794550243; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MUo4E2DO+FYhAy9i51929+r6hBXKgVANxqNcwu4qVo4=;
        b=CTUao0sQvj38LwlcwDT9FasVfWIVIKSaNZAhOT0Gaj6+STLA6a1QY5HPqGzDUpUCRj
         fYAr7IfqN6yavIXrERhMG6aeddYk3cJAkO2pBfs8BLNNA3cRrMakVYiLedqIuNXvz3a6
         osSNctV1CtIsE+qGxyRBkY8rbTi27CEC58+RA/aMF1YUceT69eyp8pYUHfMPw3OL3iHz
         UwqOmr5bDMqTeAB8uPtUUDz92DVhwf3ZNysIk4I75w1cclqJEPIORVxLXQIJSZFu1GUO
         0V5Bug3F8P3xD1ppx468ix/u3jgZgw3ZmCtoILWRFFlCdpD41DQAuPvHy1GqAM0Wjcbr
         9fpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945443; x=1794550243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MUo4E2DO+FYhAy9i51929+r6hBXKgVANxqNcwu4qVo4=;
        b=RnvsW2x2CPUJf8zkikNm1nFD5mfofuuB4IUk6UlxdK/X+KS+vAyXUMc8x0Kr7L1+8d
         GJREmD3nvh0vjFm1HqwMgjSKIT/+fE7ZyogsxQ7e98qHkxO+PcOH02lkBhV7lMExDWnl
         MvbuvK9KI/c3lLoCRkj0URkwuWmp31ApJ6EURIUjI0yX8QbPXpkdsQeZgra42rgxcwoI
         QHi/O/5SO2BCKlu0hcMRdwKPzGobc46rThFaklwDLFu1xMLp+zx2UmzEDAklPwUOf3JH
         ZruwDgxFYppl/cXBB8hXuD7zZ0gGLOWCYnfV0b0bIPly5OiZAXpoiE6eY8Ow8f550f1S
         xQ4A==
X-Gm-Message-State: APuU4Z99XX5Dk6O2LJDJ1T/aRp6hxEDcR/7Z7dqwKVVl//acfZbzOsHJ
	4YYQzVw31TxHdFYyYPuKXTSKTeTCLeUi3MVjRXvpVgiAcboQBSXGPf2XftvkZM/4c9/jdZCzjHl
	VHfv0o21Fs55VVTyBPPGHglJ0SWYBOzlGf+aquBRLpKvPPWkh+WNRC/sTTtg33B0Vjl/OfyA=
X-Gm-Gg: AYBFou3VWl48/6ISXJ0HMPpY0h9Z6BfDc7XX+tH0fel3KtrHZCqRSgyD3YgOeuQyPgG
	l+lZKkxP8QFCjr4gRTj0GdZDCaSD8YG7l3IUF7bZxB3UdyeyY3HG2YMo1ctqLgE2xBcuqjzgl4/
	hIhtRGXLa4JIEF+nlIz07QGO7R6o+4M6i0D7IU1E8kEkvv/EjryREGlZ+FAA0mfahMey6SMS7Tg
	Yu2ML0lcsz6arSvAvRqLHDsluHCPuMtxtQJ4734GN/aoY0PqYUIHOWyQHeUfMlWKAIqI0uHqfZd
	MYEpu6odhxD9GL68lGeIZS50iFG7SGbmfy2Lw3C0Ekh7jUV6Y1vhodF6evoCvKvFmUTjqN7WPL4
	FMJWfVpY1mom9EYDhvSJJ8jkeueb/lnVyI9nmOVNiMym8e8pLAPSXzEhZgBceUubeUXe9PBUKl+
	FnuHol1tV6YnBCpYqFH5eircTjqmoUb8NpTst4/g==
X-Received: by 2002:a17:90b:5705:b0:3ac:77a2:18b1 with SMTP id 98e67ed59e1d1-3b0db70b7ffmr2406598a91.5.1793945443144;
        Thu, 05 Nov 2026 22:10:43 -0800 (PST)
X-Received: by 2002:a17:90b:5705:b0:3ac:77a2:18b1 with SMTP id 98e67ed59e1d1-3b0db70b7ffmr2406567a91.5.1793945442700;
        Thu, 05 Nov 2026 22:10:42 -0800 (PST)
Received: from [10.249.11.239] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70a05c5csm235156a12.13.2026.11.05.22.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 22:10:42 -0800 (PST)
Message-ID: <cc150747-96a3-441e-94a8-a7be06b6bea3@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 14:10:39 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Bluetooth firmware for Qualcomm QCC2072
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
References: <26c5ed05-8ba0-4747-8c0e-d8c69cd6b012@oss.qualcomm.com>
 <6rptq66wpput353d5rn4cmvbjmwvz6aljc5a2r4zi2tj3ghahx@xxoibgwyc7yu>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <6rptq66wpput353d5rn4cmvbjmwvz6aljc5a2r4zi2tj3ghahx@xxoibgwyc7yu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: r_nfTiLD9M4DDn-tNmIncDPRLbpxHfPH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyNCBTYWx0ZWRfX3JwU1/kTJlsn
 9nSA6giU+IVZKFvlFeRDqNG4t1rgQYbeTrVHa7GkGaLnFc97w8LThSOMKwUTepcVt4nfx/nUypF
 bakP8tt6P1w8wjyCgnfDEjkoOwz5knE=
X-Authority-Analysis: v=2.4 cv=e7WT2qp/ c=1 sm=1 tr=0 ts=6aed6f64 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=01KbB4ZiwbKj1lgDp54A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyNCBTYWx0ZWRfX3Lm/0DdVTFIA
 QNmJkPMnOXirjAahwiFJVWZR1P3IrFyzlRRrB2earp5rMxIn/zzcl2FDLCEg/5kOJQ+6q2FijLE
 V9WSbVMih8eduPoFoviuqxJ/pCHyj8kb8GA0UUNQXxrxwFdbRkdbeUhYy6kLiyXfYyALa2bZ3/0
 7IjVQEHnUH8bP5W2h7CNHgqA+rVub6UREXZeDPVfwWbq3EBmIJgwjbmVXj1CYJTNMfLMJF3qlFM
 ZkVyNUW4u/JrAvKcdDa2x5v5ia1xMNhRffpD2xsZWjYWPicSE3gBsdLRsaE04F/f7ZelvdW5svv
 bo4wHJU960WiFDWe06hZr+WysnLPXVsMVLI9PcFvN+Fu0zcS990tRnnyXOKVxKlK6Dh71vX+neG
 JwAN8vTpa57OhxB9G0/Ncw9YWagx9gAm86S2EBb1NJWHq+Y9jXEscHuOunNIc2gPfVG3YSgfWaG
 lWcnRhl8ebTEr+oCRdw==
X-Proofpoint-ORIG-GUID: r_nfTiLD9M4DDn-tNmIncDPRLbpxHfPH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060024
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/2026 7:33 PM, Dmitry Baryshkov wrote:
> Merged and pushed out:
> 
> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1358
> 
> Please abstain from adding multiple copies of the same file. There is
> little point in doing that, use Link: tags. I've submitted a pull
> request removing extra copies:
> 
sure, will use Link: tags for further firmware up-streaming.

> https://lore.kernel.org/r/20261105112700.21315-1-dmitry.baryshkov@oss.qualcomm.com
> 
> Please take a look and comment if you have any concerns.

reviewed it and given comments.
