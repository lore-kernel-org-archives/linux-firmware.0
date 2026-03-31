Return-Path: <SRS0=XLrK=B7=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3810FF60D2
	for <linux-firmware@archiver.kernel.org>; Tue, 31 Mar 2026 06:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9C54BC2BCB0; Tue, 31 Mar 2026 06:47:27 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D9E00C19423
	for <linux-firmware@kernel.org>; Tue, 31 Mar 2026 06:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D9E00C19423
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V3lRRS843027
	for <linux-firmware@kernel.org>; Tue, 31 Mar 2026 06:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vzK5KfGV/xRSe3zNPsqjRj
	f7GXvCzLZTukCEn3ThAJg=; b=R0HbbtX1hiKPFbL9DnSANRN7vm3Wk1YSMnbYd8
	q3K8cq3u6cX6SkIW1ea8R0vDg/s/KLFqo/+rmvpplswbDpJTZtj09gobDJVK0imY
	aQbLKZafwB5CqhEBRAkr8cYQT/DdN9mNg2mOC77ixBzkEDgQRDc7WVz1siyfOW0V
	M6fuSvAwVV7q3dqqKMVD2IUocsogPtJ0O+eoqYVCP+/jpP+PbG6a8GKLJ41z/uBE
	OzmZ3y89KRQcvLGI+dTjNsmcc800QBJdCdOHx75VJ64V36xRyOlXO+Z8sJz+0VMI
	3CNE1rYQ/2wDfskMPRzCZgFiCpFrvHph0XYn6csCbcFwKS0A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d86nt8ku3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 31 Mar 2026 06:47:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2489af602so32474035ad.1
        for <linux-firmware@kernel.org>; Mon, 30 Mar 2026 23:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774939645; x=1775544445; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzK5KfGV/xRSe3zNPsqjRjf7GXvCzLZTukCEn3ThAJg=;
        b=Bm6+wkBevOT1DvGgi5/kPj9rDyDzl3Ar61sVE2bWKlrse+3II5DZxCfrCbwZfp90wY
         4IlvwNwzeszAc49H01+WSo2esurFyq0fGZ9vXnjmApCLQVvBDKfvKA2ndiwik7bKIlHi
         ujS1pcx7NFSd3HginPOAzF+eYI6UjwcpvepcMHxdJjGxv2LXf4DaH1rpsiyB20UZWwHT
         fQaYDVssKhFljQ3c+C2x/+uDU5h5e6wls8rNXl6aEhNryDZ1qqJzGdhBnAPz+XTqtR9U
         2+cLX1R3/g7bnyfHEif0wMkAKMQOO4JuDYEySYoPNw9VSNY6aGGi20PTQNFmPl9TNKbl
         KZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774939645; x=1775544445;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vzK5KfGV/xRSe3zNPsqjRjf7GXvCzLZTukCEn3ThAJg=;
        b=ZtiVLETo3QWNdZPAM2lRT0w9s5qnqn6rICef3KycfCHuQX/+0PYQ1YAG8THdF04n/q
         lUDi2xH6HDSpWPCl6KzeM15p0vQn5O5KdEbYOqCRJ8BEZYQWoIxOdBS8E61EV3qLkx5W
         TcNA25UUC2nX06didJY4mjbRTZkCUCxQO5P+wH0uyKmA7351QYkL5npatrV8PFzog4uM
         fdl3uhjnHxhWvMV8j9a0uwKKzcG7eI/hAXYphhGfmyn8/B3DHquilsQg8muok4yD/3na
         63pwAjeMLhC0wv+CFIZcoW8VtY93zozjxqN9eohPK+ZXTGOdi4nWfZTi69cgY7nfRwqf
         UbKg==
X-Gm-Message-State: AOJu0YyI/Mm880ceYFS2RuIWFkErBbVVMWqSCoPHd3ByOxzYjWzTsb7/
	/Ri4aweI2fl63rybtnNnKwKib2YO99ZIgcqHL/7lIff8NdmFLFYoLfCdE7BD8/RtyLrcjvNqmAy
	UEB4KZT3SBCBSkHAqDN9RnnVoeeW/AoiOHe7PeAdr8YIE1TsDcwA5lEZAp7L9ZGuErucC7Ow=
X-Gm-Gg: ATEYQzwlKaW+Xg03MxLga1/TB9XTkGY4Na3NE9GR66ma+OUZcY406KIiGMRlUoArIBO
	cp7FdQd+YSutXThw8efGlCb/b9lewI5aCsK9cheElykrgSCpYaXKraOaKu0oM6M5x1kPcbrsirN
	360V/jzmMQo7Frg/oCYwpsdH699kwVgUz6xYrKNn/kw4KmMwr4SXEBafBXk9rfx4wlV2A+9J+aN
	sMtTT37J/vacrY5Zi9NvV2u2m/mkRVOL5K24ORtfjqkjKPq9MBVG/GFIu8vG3CPhKQmxWzsH/OC
	cIc2GLl0H2ssCcvDKshOfW19xMjT430Yk7mQSopbKpbziO6MgUrEbQrhKNzhOBiRwRp6v7prrPL
	tu08I7lfS9/u7yWblfjBpgHczhzDxbYuCQoZlWl/ECCKuHbry5w==
X-Received: by 2002:a17:902:c94a:b0:2ae:5ab4:f4c0 with SMTP id d9443c01a7336-2b25eef489fmr22618385ad.13.1774939645074;
        Mon, 30 Mar 2026 23:47:25 -0700 (PDT)
X-Received: by 2002:a17:902:c94a:b0:2ae:5ab4:f4c0 with SMTP id d9443c01a7336-2b25eef489fmr22618295ad.13.1774939644542;
        Mon, 30 Mar 2026 23:47:24 -0700 (PDT)
Received: from [10.204.86.38] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427c5f5bsm104415375ad.82.2026.03.30.23.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 23:47:24 -0700 (PDT)
Message-ID: <e115ca3c-33eb-41a5-95fb-42d5767d474e@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:17:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: venkata.kota@oss.qualcomm.com, kssb@qti.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: update ADSP firmware for sm8750 platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3zTZG4m_TKhk2lcx9dXbr3-YfgsyJHT4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA2MyBTYWx0ZWRfX+PpIRfAUKUTg
 FJpfRYIqmgI++BR0cipj/Iz6YxX+Ww9SY58oclk2QeheQKNk+mTuCoZYGwB7jANGyN0fWu/2gmh
 g/sCpWMRh9LR886KMPDEeUA3HW9rdvWaRpR1nJdN6Xbl5xTE7efaWcBWK5Zu11yZJGeFlCayt0j
 dKpsi6mIFwVToHC3b4oy0uDUPiKPkbrXiLt/Jdy6B4JpGNIYj0X6yO6WCgxfwJj7o4e6q33KRzh
 mKMNc5oLxAvWhFArYndAuHi7MiWFGLk1VqeOuDk92HigtvQYVPDHDXLfDDHWWmH2UNcHY5OQ5n5
 +hWlyTSNlB0dGolwOSHzmWxWVEnFTv52UtluFa1y+CDxrqJcug1Laqncr8XzRmba8i3aSvOdSgT
 yqKrvTM0eMuH2FyJRw8J3LtAH9RACCuH/PVDlx8cxNAg9qjD5n5loqBAHWbluK2VHh3+5Q6Jlz7
 7uPYwvS2PugVBxCheFA==
X-Authority-Analysis: v=2.4 cv=IswTsb/g c=1 sm=1 tr=0 ts=69cb6dfe cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=qC_FGOx9AAAA:8 a=ki5w4FO6zcoBtXkzwaoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: 3zTZG4m_TKhk2lcx9dXbr3-YfgsyJHT4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310063


The following changes since commit 85786b4413fdc486e3bc0f4f6cfedce7802ed041:

   Merge branch 'amd-staging' into 'main' (2026-03-27 17:22:24 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-pakala_adsp_18

for you to fetch changes up to 47fcef3409cea1043a33ae74ba1a98e55877eb09:

   qcom: update ADSP firmware for sm8750 platform (2026-03-31 12:12:45 
+0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: update ADSP firmware for sm8750 platform

  WHENCE                   |   2 +-
  qcom/sm8750/adsp.mbn     | Bin 19413384 -> 17639864 bytes
  qcom/sm8750/adsp_dtb.mbn | Bin 180024 -> 167736 bytes
  3 files changed, 1 insertion(+), 1 deletion(-)
