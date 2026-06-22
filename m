Return-Path: <SRS0=63HA=ES=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F96CD98F2
	for <linux-firmware@archiver.kernel.org>; Mon, 22 Jun 2026 11:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 834B51F00A3A; Mon, 22 Jun 2026 11:46:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1782128770;
	b=OIIkld2XOwisz2Ujdfkn7dLU/XuPOOgXF3r/rH+t0UHggus0SRnHiAZtgKbcDXxH01CN
	 sViRjHfrNCiM8D6xZW6GA8HlY5EChukrYHgAflvdQWIlGlfIPyrgZ1vyyKX/qVHz2S36F
	 JOqArkTMSXwPrQ9P8UhSnpiy0U964Kd4STj4VpLBhDujXj0/2uVgHSw9kbb4nWXA/V2PJ
	 RTcqFxpb+NJVnSrFTgaaIVNOTpBgcNsZ3uRMApd2BImKuB/mqE8dzWFC4zq40WU8/C+A6
	 /yk1bP2wxObdhtcPZMyRToj8fKAaznsuZtpPJSGwQMqJ7eXrCaQsx27CyREaNNXJTNw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782128770;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1C4DjtPUk8lIK9p+YXxlTsGxiPwpXZbiq65nZvdBJWc=;
	b=Do/kTeC7DI0gRv+ALmR58HfnlGuEUUb5q6nk9qk1EDo0QWuFxzth2n4ATb7oumkxNUEq
	 wGk1+gtDVR3y6I0ZLRsReAGxSrDIP33ah4K7fPoR/z8sPPHjqyhLiUf+16uz4lwoHkal8
	 a1u9KwFXJFQlrvfUNcPUeQ71rJEmBERGDfMMrs3uR82uQTk6++KWOwQUg+BFLtXdsxTFK
	 iWcpHZIePQLSQCOGdLIs3TLVtq9DRnylAsoN2hs7tckxY6wix8snOchw0ftImaYzyw3Xn
	 aPtnevaNUiM4tMOzT8fjGb/nbo6+M/nikEU+QRcylgeqN30gdmt2YkBs70m2saB6UPw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AFkkUSWk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HFJvTDVS;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C5F7C1F000E9
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 11:46:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AFkkUSWk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HFJvTDVS
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C5F7C1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MApAS5773335
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 11:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1C4DjtPUk8lIK9p+YXxlTs
	GxiPwpXZbiq65nZvdBJWc=; b=AFkkUSWkaFwjICjw2ovWe1/AndioZQwbw0u3Y1
	/omx9KsS4mcifcQRZsV+fkrOOSBacbonWCtY4AR9Q0RTt3XKCFavg+pejF4lu/5P
	0/Vofwu274g05GI3xDTG0EHs3/2+IDKqvD/ERX5105LqXbsZtrtbGqptZKFNN0Q1
	w4/ZOrinvArlBqDccpgdR46IxmuarSoqzjCYuuNHHm3p6KVktkc+2/MAZBV5V+Qs
	NPgP6+qvhPyCxyCiE5H7JAZTYNJNo/NukhNGCMYkQjYcFbZdO5NIiKyuadwUBKk0
	SHxTCBv8misxsCz/2xKujm3opvdqf6t96jrXx9dQ6KNYMZWw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewj6h6c7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 11:46:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8514f8ed5dso2902382a12.3
        for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 04:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782128768; x=1782733568; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1C4DjtPUk8lIK9p+YXxlTsGxiPwpXZbiq65nZvdBJWc=;
        b=HFJvTDVS1kdkXbw4L04/lTMB2rmZsNg40/21aQ8Cap6K9tObrBDZQYh94OLMqb/Vjj
         x8qumO+DSb0u+xTguslEkytZxk+6kaKFHSFwbXNCK/NxYIzQQNSzutVBnzLSPMkqDqAW
         cnAP9k6evW4KwPzn84N365wDJqYjUfii/BXGpNxCzQC7frotVGoOI+xuBMm+OwW1bATa
         aImGgCEbL2xHLdo4m7ihebRZYI09dAaQeIaBlK6Q/ljVz6eLQtxrpEuR/L6bUZ6D+S/8
         09mhcazZAYH/txmHrqviGKtQxXvQzb0hjA4ccyXtYYkABM+KqMbTwAI4BRPipU7lTO9D
         mxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782128768; x=1782733568;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1C4DjtPUk8lIK9p+YXxlTsGxiPwpXZbiq65nZvdBJWc=;
        b=NHlNJVsYIpWmaEFMiT8tX7f4bvmd4iNojnEBRRoUb72lCwByb9vMJi0hz99y08zOKV
         i8tjmCEd7UJS3BwH4XgNflcxynScJoQecSraQENORIicY/Hkg1R2EPTjtfkmO0Ymo7A0
         pK8sYhc0AZZSwHkxHQeBqy5MG20xWoFPZW8F/hWXf1vSdDdtVHmLzWLjNNhGHEKfb8Za
         CbuTDo7+PEdhAuV/LYFlBLfWdUggkyWS93LIQGzMBIInBp1YAuiQMxBuK8dXLLCgFU4H
         8xpm6qQXA3H10mbuRlC7Ljkv/m8s0g5XW+WqJH/K0kj/lekxCSYqo3Wys+cRVEdLLs3v
         LcAQ==
X-Gm-Message-State: AOJu0Yys1B31tzrU6B8jISle/xU7jjCpR3bWakQeKHRyAR45i5Jhpm1s
	fhB/EIC/AjvQT1o8zhLXPc1HNvLqCkJmFVuoBIMPYGHoDpkOzwv38HR0oc3w8HhfgPDKn1sjnmW
	z/BaOUkwUwcJaB1v01dEXauTUPzVmO4BbzoUqxXq2cS4mq+wt65jSHeutIZRgAaxkDxAeAls=
X-Gm-Gg: AfdE7cmmj3ZV0CXRcZMFHAd/LveJ32ZYJOhxeGH6ODxCjridR9CC37JjLSDKrrRQCgl
	L5YsSboZXzmaDAfLAJRfl/sEfAz/6bbWnha/01hkWYTD+gRz+4KqA8bZplmtRzKFODMskSug7/g
	9dAZchC1pqAh3sGkl37WE9cy+PUr8/M/tP+AuV4dO/1OyvM4T+avp3neM/KPmsk/WjViR3Vdfd0
	V32ljQYO74m6YF7LDDgm/yGDR1vGjHcb1It9UfTeGpQSMpQTgx6bHCv8OhJ+xZuqoXg2GfHrbiU
	grNH3WSRGz+7ih7cQKsZY5Xhnj00nu+5RHkQS1G7QgBAdbHH6fUWqgifilsFfv4x2bIqXlFMdqZ
	CtXI/j5rpphAJ3sgQcg1MOcz1abH+6HCynPpvlTtS
X-Received: by 2002:a05:6a20:e291:b0:3b3:23a2:edff with SMTP id adf61e73a8af0-3bb35062407mr14292507637.28.1782128767605;
        Mon, 22 Jun 2026 04:46:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:e291:b0:3b3:23a2:edff with SMTP id adf61e73a8af0-3bb35062407mr14292460637.28.1782128767121;
        Mon, 22 Jun 2026 04:46:07 -0700 (PDT)
Received: from [10.216.36.169] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc563c6eesm6742212a12.21.2026.06.22.04.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 04:46:06 -0700 (PDT)
Message-ID: <59d7567e-913d-4aa5-b3a9-fe1f34c0a21f@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 17:16:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: add LPAICP firmware for shikra platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDExNSBTYWx0ZWRfX3mVx0f/kkNWp
 YzynaTtgPkJ5eWd6x6+KicxOat82q7BqWDxkTccJ0zKXi86MXG+AC5vhmGuuYCVLaoXG0MRbcmR
 DYcbBze1XGzjgQQxb+/c5UEz8injI8jCEO7iCmResu1qtBwSZIoy5hDBTF9kg2VCbqUGU2XanrV
 tTzPvNNeC/8V2TynUQ3QxexTA83jdN2ntgcOkI08Z2GBFiQjoG27kNUSmiEyIhlN4m5iqRaSroS
 HO4hN66IRCHD2creBw5+eRZWZio390ViRHLelluflr6PPN5xMoSySUIaMuk0D4LYj/m2kwnIYrp
 eLlQ4tDEfNKSTjz9OCHmsy5Sx1yrf+sp1CE8ylhj2t+pDjz5kbMtVBVhLDmM/Sj3EwcXDQw58w7
 BjOESHExdId2XjxS5iWapsBSyKyougME5UDf9xyykfToLwEEcVuovVcc0tZ27EQKV9nvtgQhsa6
 iCG/4y1lYlmpnRxLXZg==
X-Proofpoint-ORIG-GUID: R7i_0mOaKgQOhFxXTA890KQSXZQzC2bb
X-Authority-Analysis: v=2.4 cv=E7P9Y6dl c=1 sm=1 tr=0 ts=6a392080 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=qC_FGOx9AAAA:8 a=hMXMwYmzv-2CvN4CDtIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDExNSBTYWx0ZWRfX3BpGDM+pNxZe
 TWHYQcyEZCKyFywec3ji9muMykFkTO+ZYMqdToK69ZKrZYVPpmnFcLch4CIKeILdEXg1HMg2aFr
 aumyVfpW5IRKTHpjQrDy71Wrjrq92jc=
X-Proofpoint-GUID: R7i_0mOaKgQOhFxXTA890KQSXZQzC2bb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220115

The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25:

   Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
riscVqli-fw-shikra

for you to fetch changes up to 85780e7449843c9b27c43329c30c203494502da2:

   qcom: add LPAICP firmware for shikra platform (2026-06-22 17:11:27 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: add LPAICP firmware for shikra platform

  WHENCE                     |   4 ++++
  qcom/shikra/lpaicp.mbn     | Bin 0 -> 1346527 bytes
  qcom/shikra/lpaicp_dtb.mbn | Bin 0 -> 37808 bytes
  qcom/shikra/lpaicpr.jsn    |  14 ++++++++++++++
  4 files changed, 18 insertions(+)
  create mode 100644 qcom/shikra/lpaicp.mbn
  create mode 100644 qcom/shikra/lpaicp_dtb.mbn
  create mode 100644 qcom/shikra/lpaicpr.jsn
