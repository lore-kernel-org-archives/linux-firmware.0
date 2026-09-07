Return-Path: <SRS0=/E5r=G7=oss.qualcomm.com=xiuzhuo.shang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68173C79F9E
	for <linux-firmware@archiver.kernel.org>; Mon,  7 Sep 2026 02:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 35AE01F00A3D; Mon,  7 Sep 2026 02:03:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788746608;
	b=KbTuFGgRojQkkCNSboZoT8ELMvib5JtBYvVLv5NF1v9RDq2q1z2CNYhGl8fsW7MZfsxk
	 sBhNED72nlDGAswiCKx+OikWaUibNJyPh0z6sYwWw/SgSEWDk8So1pOhI97VpKCSs+z53
	 Ro5iKlQJCzKejDHZVAiEz52lIxA1H9l/1rwB43J7rK/7Sk/aZaKlIQN/XydFnRQIl49lp
	 NrWSvFRlxyQWKPzihYD5Kv31/T2quIJGX+6VpSeE7mnJItbLWYQXI/1buWpQ1jDPbPGCd
	 UJ7MDN2w4vzNvraba/0YMQ3n5juPzBwrVSKL5KCw//gUCLAhHKDHNzKNuLuShIxfO8A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788746608;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2CbHJfssfgHjYMaS/CQhpqetcYjn7H308FeG5cy4neg=;
	b=IlPHBPQw2TmryctYV+GXVQuw7tm3Ik4bhlEdn/9ZFood16YlmuCOgZ0oeioSQQ+gptUB
	 r2+AXSu/K8232tnmvFBlJBcPpu4/pZMlMPYS0IzmE/LZmXIj1/6rnNuDE9768f8OKIuhR
	 636fS8Zok8iikjskLBIuTrgVNoK7jLLMHuuBa+2wHzFdHHnjE5VsAmY2uP73rJSZxvRMD
	 VJ8SGHXbBJVdzr0FmU0roX7XgsA0dqk+JCYWc6Vrqg9FkKXK5JaN4JvXBsxyLV0FUyOzI
	 uIlOW+wQWUcDYPB/zvRg6aqfclIGzWTrsLQejUAtYtHSybYML//2kfk9Jo7e069z7FA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e2T66brp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ka2jFYDU;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 945CD1F00A3A
	for <linux-firmware@kernel.org>; Mon,  7 Sep 2026 02:03:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e2T66brp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ka2jFYDU
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 945CD1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6870B63e3259437
	for <linux-firmware@kernel.org>; Mon, 7 Sep 2026 02:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2CbHJfssfgHjYMaS/CQhpqetcYjn7H308FeG5cy4neg=; b=e2T66brpEZuFAUtX
	Lni9gNLYAg6ryY0ghKiBVRcDYlgtvjxNiCV6+MEZ1IKX3alNwxb3B0egPHUv2FWP
	E2MqpXAJWsTjvXYtOgoKIDBlUphauClL9kWHRwQ9YV7lCXYkTCF1eOc02drBfMHy
	VB9JwPZrVcvHbttVMFDG/TiW+RXJvmvcKBG7D/Lygw4y3pfNf27iB4feGPAQ7Xzb
	vojjO4OUgwO11AbtTDqv5CjqIqyJdhYaREBBpjwa8X3ov401bPmqDvJKP1LeXp6M
	nretKGDiNzKxRv7EzDuO4rfb/xos7ffsttSfvlPCPgOpSJ6E61uHmdH36QXIBSeq
	OX1Dvg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfwjgd5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 07 Sep 2026 02:03:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91037946caeso26007056d6.2
        for <linux-firmware@kernel.org>; Sun, 06 Sep 2026 19:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788746603; x=1789351403; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2CbHJfssfgHjYMaS/CQhpqetcYjn7H308FeG5cy4neg=;
        b=ka2jFYDUPrzTbLyHxsodLlXm47pun5JjiJ5mLMoZSLDGnWB54GG/utT8o7cObeWFly
         HcBxEt7OW2ZSfcVzzn3D1paFrMY4gFGDg79/zxQOmGdw1lf61AXRXVPh+Zrej0Df+OTA
         c/Mue/fu0x/9L4BRDoyfEuw6YRmmSnmYwgGOY3xSqsKbpjv6AcJgIurUuEp//eHd07tX
         VMW4StzDgE6WK3XOtJZOHYGIaqX6FN/IwNWf6E8pUDeSLp31BhY5kH+VdVMaj+ph+/7+
         EK+LjGB7UdaMTtmDlKIBB4Nqmkb3H6xScstezSLJDW38QP0bQctlm28pF8kg07W6sJF3
         GAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788746603; x=1789351403;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2CbHJfssfgHjYMaS/CQhpqetcYjn7H308FeG5cy4neg=;
        b=eD2tG2DYGTgivj9cvoNi88CdPWN0mR3oyw6UCfFXeSRGuf8Ir0AV+D/bb2g3p1zMSG
         KN7uXqe0ofhxj0528l/JphNUE46PYrvybdqhF9tQzqBPpNlG1tUmjfE/tOuXY6xjuEw0
         pBui21YDfNbB0NEs7m2OWHQarsMAEdKmmc3LCCwEXs6TtdwAeCqd1cJxVixZ8BRWT/0P
         3JIAQ4VFvvGYYQKl+EdWKfea2lFesUZUnXvSOxaba85gIl8M01K3bMYLsRO9MdSCvbYr
         jtcu5P110r4J2Fo0ZqiZgcUC69s+KesRZ4pQ2f1r7j5FgbpnXI+dw9IgUaDh8T2REzzr
         Rd3A==
X-Gm-Message-State: AFuF++kIpgSvuz4bIu6TwAriGTFpF93diBSfltfo+m45RTWIhLPmZPv+
	HYUSNYUxuw3z5mV3XixWfpsjbkb+AJhiYRy27N5xJz4S+Gv3Z7BujMyg621ejq/Jnnq1W9/1j50
	Ro30hqyUk4je60b85o5v2Vg/pDcLJdPcd65LeNav7lrPeSOqq7l/QbeEvxgaD9EpYVsiOKgM=
X-Gm-Gg: AYBFou1yRuEciuf3IprzRgcpySrD1MMAt/wPUNIs0DnbrVpDh55rhSvgWrxwgMgrUkp
	Nl9pByF9f/835rqUZvNziEG5MPd48vOTv2SqEU/0654V6dWDId6qomAKR0GwX3EZMCxw7a69LL6
	Lyx/Mzj4aVrGJIZ/Ltl66a53Op0LRpQlMUH7G5Jm3YL7DUx3LOkVErv3pU/EfcgDdNVb8pPFUIV
	Y/TPDbetJ7NcUKP7dkU8C0nSC3NQXMtyTkWAIxF1FkfBiU5Bc3PyeohtFxoJCJz2a3EDqCzMXY6
	ZtF/rcb3bwjBt/JvaT5tG4OdxA4+JcHchvKarcmvvFfDbnITwfW/jaICuS1ldGU6RWNY6wYb70V
	AzPcflfdAD3AnEvtzu9jvKlqW4P19
X-Received: by 2002:a05:622a:991:b0:52f:b495:e9a5 with SMTP id d75a77b69052e-530549c537cmr244486361cf.37.1788746603322;
        Sun, 06 Sep 2026 19:03:23 -0700 (PDT)
X-Received: by 2002:a05:622a:991:b0:52f:b495:e9a5 with SMTP id d75a77b69052e-530549c537cmr244486091cf.37.1788746602887;
        Sun, 06 Sep 2026 19:03:22 -0700 (PDT)
Received: from [10.239.96.184] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305413ce9dsm75887351cf.11.2026.09.06.19.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 19:03:22 -0700 (PDT)
Message-ID: <ab9ec764-6f47-4219-98f4-7ba078500bc8@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:03:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA: Add Bluetooth firmware for WCN7750 on Maili platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, cheng.jiang@oss.qualcomm.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com
References: <cd7caef5-5d32-4751-a536-8a25ec3bd7f8@oss.qualcomm.com>
 <h3iqs33onqhedpwryihvha7nebtdccfrvnttzfusvrwjkof56w@7vfkegied45l>
Content-Language: en-US
From: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
In-Reply-To: <h3iqs33onqhedpwryihvha7nebtdccfrvnttzfusvrwjkof56w@7vfkegied45l>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDAxNyBTYWx0ZWRfX6nJKKlexqXvI
 To4oZUJ5uAvna855kxKfR2lzjJu/AxJOMD+hU04vgvUZtrWAqZPBl5XmZw/pCE6G3nDHnWQhocY
 1M3euZI//NnmVV+NjoM1iZWrjDyY9Ek=
X-Authority-Analysis: v=2.4 cv=NanWEWD4 c=1 sm=1 tr=0 ts=6a9e1b6e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NEAV23lmAAAA:8 a=qvf3wFXFuW-mFknEdkYA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: fwC3dCar4t1e0eFn0csY5fm4Dm8R6FLP
X-Proofpoint-ORIG-GUID: fwC3dCar4t1e0eFn0csY5fm4Dm8R6FLP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDAxNyBTYWx0ZWRfX0hAPfFXxveNM
 NAW/yY3VPsS1oQYFCEJ0ccm8yv2u3EDnb0z+vzqaRsFonIiNJzqa69zr3Mm3wDHsn/151KYuEW1
 l+qf4hOmtIhF77imHWlH69KdNTZL/1dziJ7RsoCUybK27t7Fpt8dHYDrswroccJ3Gmymb14779k
 g+nJl/JRognb/j/3yFsSvsrYOcM2ABZE+8iCqvdJ2wRv5WFlOEygkrGrQT6t6tSu+kLuxs0V0ep
 bDhITZMPy/YOI+dnxUIzdCKrwuSEB9fvwadavVKPuD4AJebOuqdgfjJXuwSR/wHwcrWHGveI25p
 aJWY2ufhvwhi8qU3j+r4cDDTp30hAMN0wSBvzUc8DOHM4cevWqcTcL3XWwXJeWIpMt+K6g6HcM5
 LxfH08ZMoz1i+itdAI6jyMVYaP+joE3eb1HxhZTEU+IkwZs0+viJy2b2qUhJC798TdeWY9BZaMq
 kQsIuje77gm3zqHjmnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-06_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070017



On 9/3/2026 7:55 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 03, 2026 at 06:37:03PM +0800, Xiuzhuo Shang wrote:
>> Hi linux-firmware maintainers,
>>  
>> Here's a pull request for btfw. Please let me know if you have any problems.
>>
>> The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:
>>
>>   Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/xiuzhuo-shang/qca_btfw.git main
> 
> Repo not found
> 
Sorry, the repo https://github.com/xiuzhuo-shang/qca_btfw.git was private, it is public now. Please help review again.>>
>> for you to fetch changes up to 1de88ae01e5bd9737fccefc8d24acdbeecd06d4c:
>>
>>   QCA: Add Bluetooth firmware for WCN7750 on Maili platform (2026-09-03 18:28:54 +0800)
>>
>> ----------------------------------------------------------------
>> Xiuzhuo Shang (1):
>>       QCA: Add Bluetooth firmware for WCN7750 on Maili platform
>>
>>  WHENCE              |  13 +++++++++++++
>>  qca/ornbcscal10.bin | Bin 0 -> 744 bytes
>>  qca/ornbtfw10.tlv   | Bin 0 -> 224945 bytes
>>  qca/ornnv10.bin     | Bin 0 -> 10837 bytes
>>  4 files changed, 13 insertions(+)
>>  create mode 100644 qca/ornbcscal10.bin
>>  create mode 100644 qca/ornbtfw10.tlv
>>  create mode 100644 qca/ornnv10.bin
> 

