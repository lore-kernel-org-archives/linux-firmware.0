Return-Path: <SRS0=EiSH=HU=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC2FC98328
	for <linux-firmware@archiver.kernel.org>; Mon, 28 Sep 2026 03:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 881E21F00893; Mon, 28 Sep 2026 03:53:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790567583;
	b=Mp4OlQa1YYZ4M+HVOVvd2Rtsd9lQ/PJC73Y6oQX0mDHYn/8uBnsGcqV2aEPSgIkbJQyd
	 pxOF8hSDvqvx/VpqYGjL6x9U4OVXnMW2NqqtK0gdV8eODjkjXguSF+258Nu3ciroWpC4E
	 uzAmHQlx458paCc6PzE/gV0OxRSRWNbUrMDgKDNozFP8pwfIvtZFTVNDhUd6OhcyE1bry
	 43QRNOxQtcg+NpdWy2C8dIdIAMqDUPfaRPbl5WkI414v0FTg2sIl1X2C0Hfg8aO4aXhUC
	 ZuJKTBpIJuLI1UFJi2GVFBPHPodpMQ69HBgHXFmd9+ODFw9r2t6Pw6Krbw1a2GxcrQQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790567583;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:Cc:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=51KA7y3CFVh4jlsyWSekXluIy1kCHhvlpMAdab3S7WI=;
	b=pY9jc9ZU4+B/fzJ7no/HaHVeC84khY86jsYWU2s7a7zHAH7YpyOxljnnorpF2lotdOY0
	 jBsI5ywrc6dgzGrt0tsoDUPs5nxwCWtA/JwnnavdoN0zbgI/dIhGcRHr+ImRIbRCgUyXK
	 A/KweaAly5T0dwkQ2qPwrLQZ8/S6qQaHUCI9vd4j5IEy9j5S4mRxMjg1zNkA0mJkoS8Z7
	 4J8tOIkd6jTfDcJRas4SQDb6pWudKwE+dOjLo9v97FLMlbS6KcJbWoDW0CPv4f/tcU/kk
	 TCqT71iyqx6+iBtsExJWFAxYBBNLxZvbTkXP3ktP++2XoUW8VWs1XSkYSkhj9dlmxkA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TXOW9nVl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ENoSfS7F;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DDB531F000FF
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 03:53:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TXOW9nVl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ENoSfS7F
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org DDB531F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RNZm74920214
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 03:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=51KA7y3CFVh4jlsyWSekXl
	uIy1kCHhvlpMAdab3S7WI=; b=TXOW9nVl+ZxmkM/McUoT8jj6CzqgZZUbpbR3LX
	UKqh2DEhwl8yjd7eOmpMnR/TPaA8NfkbfPQYT9alVbkUwF+9HKTciHm2tnoEuJ/B
	ToiAKW1se/BICUpS7G3nxWCexKTxnXHFom0NQnKYLmKkd9WUDf9JDYGN7qtUX8GO
	eopuLzb76Bjcgh/X2+l5pD9/Cs+Fh66wvuYQkFmdkVjIXpZ5Bem1qDNEfyt6ssou
	EoURpoFjsgzeLkfcOi1zV3c91JLleVMBkyyvKg6XnH5iVfqWKtrOn59Q6o3otwrI
	GpbPIbDjT6C1EBsNfa1FqF23KE5dZ3RTbNgYz18o1oV5s/tA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3rfvqw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 03:53:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30f1b904861so3875071eec.0
        for <linux-firmware@kernel.org>; Sun, 27 Sep 2026 20:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790567581; x=1791172381; darn=kernel.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=51KA7y3CFVh4jlsyWSekXluIy1kCHhvlpMAdab3S7WI=;
        b=ENoSfS7Fxu2mMahKlMAT2poRsYjN+H5/VZ7Dbzd8WoMR2paajZWLxfMvzqUtuaQ8Yl
         405I6U8Smm/C337UJORptXDDzVu/mEtSkXQvffSeK7Zx6T31mXwD90Hryz++0u9z21k6
         QQQZwQby22/+BDkVLpb1yo4MJsz6OqzRC8XC4ECS6K9muTqdM8jAsFIyDwE5+WPqdd8w
         Vx0qKXYOa/ez04TfrVMmLSFdMLfPvQpxK3TIYhzZDr5f4IF35o+uryonR2OAUQOP26Ns
         a2O5HSdLFSAJi+66loqlUqe+2lBXMXBKlvABZLYatAgCYhwoHGHJRhllBENYcTkArxbj
         j9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790567581; x=1791172381;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=51KA7y3CFVh4jlsyWSekXluIy1kCHhvlpMAdab3S7WI=;
        b=ozoQcASurmN8O35CZ+nFxz2CJx2VVxk53GGceC3FOww64R35ka3cWIqZvMK3Lq5Uhs
         iPbWUbh41+uwAieFr+wvE9CEhIs+vo1TADbzJ65/nii9etYNKxOcwyjB9BZteoLDBoyR
         VLvgjA1MB3iPzYAwGNMO53BH5e5iOa/vSzPW+oQRrbdbvZ8YOgalE7XabsPmInxn5o+l
         TzFAz6Qv/BNw9VHvZGX5tw5e0+sdJLy6uhs0CSdX1+bs58HNM77R5d7PSCCsly6xyB1v
         JvSMHzahNUcc+YeeIpkfZFSj3eVNHr7pYdqioaFlAYmAJBe2tNi4UPBAAMkJ860gT9gY
         0wUg==
X-Gm-Message-State: AFq9FYJn+9iR1/AZXv3KfaIlpLzOCPaVIKPP8cqu3ZY6K+YqXYIG2cYD
	o4kAe8oIXd8mTOapnnNfbNwZ3Av2dxJGG/QBMIupEQeGzX+oCAkaqwV8nMkFjATsXeD3Xofj6xn
	/1UorBEC1fsM250WsN85Iq+gEe3rdvwXjFVMsyTZHiOsFhnS1nTmg8t0diTPuyTA0y6t7m1A=
X-Gm-Gg: AYBFou2SRIjshKDV6Zo+BSrN85I7zByJQ/oaJzC/8JyGHwjkdxHQdtGgwFw2EPEgkTP
	jEzpCQ8MP+u4jLpqh+VWqTiIY0o7WJ2zcIiPUDyy9U9AqRgKknSernAMqoFQqgjF+TD3SlTQvEC
	tqqdLw+oJRmPCPiulmAnkpwdGhelDUh+/QVy2sOVR3M7UrIavwN64rpSkkJsVZzMrOqWBoPtzLh
	lbHk9LtZLyhoayLJFlDLMxqOgFion+mN8y2tdYePvo1gPTWf3qGBrmOgLvUeQ2hbZIrAiGYZ+d9
	XZC7qPhyFa0BUaxH+5RPnKDLQbjZaaeLypgxyH4AhJ7tcMkExY39xMKUXL2EkIstQTXpqzppotd
	LIx9RquTMpGSVcD+ihHsFFR4oALIg
X-Received: by 2002:a05:7300:e102:b0:33c:16f1:2e11 with SMTP id 5a478bee46e88-3426f8c3e9cmr9013758eec.7.1790567580945;
        Sun, 27 Sep 2026 20:53:00 -0700 (PDT)
X-Received: by 2002:a05:7300:e102:b0:33c:16f1:2e11 with SMTP id 5a478bee46e88-3426f8c3e9cmr9013736eec.7.1790567580366;
        Sun, 27 Sep 2026 20:53:00 -0700 (PDT)
Received: from [10.219.57.13] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145c17074sm22931664eec.26.2026.09.27.20.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 20:53:00 -0700 (PDT)
Message-ID: <17812e6a-365a-445f-81ce-42d5bdc774d3@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 09:22:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Saddam Patan <saddam.patan@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: Revert "qcom: update ADSP firmware for qcs615 platform"
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxNSBTYWx0ZWRfX8IGNGPiW5hQm
 VKtbp2CGyWBzk7n8l96en13d2CF4wgzissQb7tIao8Xdvb9f1dPbb3utGyjr+LptgoimAWDn4kw
 sm/qIsXQMhzrZby6Cz2GK2k9Q7uSss8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxNSBTYWx0ZWRfX4+h6Nvb2baCo
 6bShceYQbRqUn/jGcdGlQhE3NTXDdlaJVL1+LSDrS/k9ipTH+A3RmB+CFPise7SosbTctMAA6fw
 YeI/A8HgD6lexZKOyPD+vZKjYiLQvPM/n6jGbCPJipxiYdkPbJrG8YtfP4T2feujqxoZ8mOdJqL
 vXlSi5sYUy401zSbcIJhuGV2siUojAKEQJVPK0Hf5z81vREvGoCzgETwmC6v5WbN1lAiIccxk1X
 s+eER4whwT4AImEYxnqGeIDp4X2U2+jpIOAkr9EZnDJYcDPRp2BvDG5Q5EScypQ/7Ug3YLl2nal
 wgycfaCaEw/xpYNqk1iDPGwmLgXFVkOkFY5BnAtZqdD3gIXkBJAH6URJeDvgRmLr+4dVyk2qQRq
 +DkN7utwAmulOtNoxG6nsldJ3Z5FGLxriZBN2ADoxDmGR6+XVJ0PO6G0DEKWhGGkBppjLoXTEcK
 L/CDy0xpyGeXclPpLYw==
X-Proofpoint-GUID: pEiPzuNA7n2Pd2do8IJL2LZJh8Uxn5YI
X-Proofpoint-ORIG-GUID: pEiPzuNA7n2Pd2do8IJL2LZJh8Uxn5YI
X-Authority-Analysis: v=2.4 cv=K6G3jCWI c=1 sm=1 tr=0 ts=6ab9e49d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=qC_FGOx9AAAA:8 a=XwlOL1DTWCUjJ3RtgzEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280015

The following changes since commit 9b858e5bb58d7bf1fc4d8818cb9100aed6d46f6a:

   Merge branch 'rubikpi3-adsp-00249.1' into 'main' (2026-09-26 12:42:39 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qli-talos1

for you to fetch changes up to e4c6dd83f2578e6c4a53d09ecd165da0780fecec:

   Revert "qcom: update ADSP firmware for qcs615 platform" (2026-09-28 
09:19:55 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       Revert "qcom: update ADSP firmware for qcs615 platform"

  WHENCE               |   2 +-
  qcom/qcs615/adsp.mbn | Bin 8659084 -> 8532108 bytes
  2 files changed, 1 insertion(+), 1 deletion(-)
