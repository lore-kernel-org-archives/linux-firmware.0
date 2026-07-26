Return-Path: <SRS0=SogI=FU=oss.qualcomm.com=srikanth.katakam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D3FC53200
	for <linux-firmware@archiver.kernel.org>; Sun, 26 Jul 2026 19:26:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8DD981F00A3A; Sun, 26 Jul 2026 19:26:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785094014;
	b=24nPE1JViS0IEfr8GYpW74tV3q/VNsEOYslc7gvXJom5sZH7Ihz8aKjWTZjp4fEVWKhq
	 aN3KG9vT/wVpcaPookYYHT9S7gj6/zVfiHAsWKAb+XCQvS/fq98NQD8Burk+PpVjLSvsX
	 DwX18Mk9JHx5L/2SjvyCZqzn9EniyoCzmj/pNywZr3N/1y3famHV6DVDyifmNJm8hI67J
	 D7oo9lrwP3v7PlKdSA6SVyR7CDdmrXiqaNcwny0c6/eEwlp0g2ZicWk5NLQ5Ctqw2qTBF
	 YA3BUN9YAIesJD09hmOPfu5j3ju82HGtrvq9pCHZUYgi/nTbY8l3XrSA+xPEFYy+PFQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785094014;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nKkSsVuRlDiZBKfVfBfg6NuXiXEhO4UkvdLce5eBchY=;
	b=xQWntF8Akh1c6a+zFyQU/GpZnP9dS/FmCythCxSNGx+qngf255Mu2XWGJxvQwWiYL2Gh
	 j+0bMTokYdo36lnvySz3ZSoVOR5wTqiVbQvd/CN01PdvRi9fFcqn+lOjwB+ADrlHoqeFG
	 fwcsQFrq9R/VHhNRNLoU3qz127JFNfasyTcNuFBs5NO3hH4YiGmzyLxB+qgB6bYtehY/3
	 cGc0Foi4r+LCQW1LxQK0wQODlrcDmpyBZySgJ4eziqmd9MtQ6rbd9wTuDoZKxtKCTdMJ6
	 0v5gewMGvxN2Dxy7mlaouAWP3ny6UWloJYI7WqIzBS0FteHzBMmbZ5w36ebAfavQMSQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a4SpNHWS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FcKsCH36;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D15F71F000E9
	for <linux-firmware@kernel.org>; Sun, 26 Jul 2026 19:26:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a4SpNHWS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FcKsCH36
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org D15F71F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH7jWL1192185
	for <linux-firmware@kernel.org>; Sun, 26 Jul 2026 19:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nKkSsVuRlDiZBKfVfBfg6N
	uXiXEhO4UkvdLce5eBchY=; b=a4SpNHWS9242/yd7dcW/qEONyyXlQPPMdf21sG
	mLhcEfFNN24038P+21Vwmyw1Hq46GexjVZc/P3hFio2/77R78T3RHLi9sGPW5TIc
	0HkK1DBLD2VddVAbY8BaLVo7OJC8GJa+x+sWOvXC2XhRAfysnHCyJG8izz8eQbgk
	fjJseA80CHMW/gL/HhcN2kVyYXlzgW8qYsImtTDakzU2sUyI/fRRag+RTc5Fp0Py
	t61++JXWXKJMgpi7VcOrtHzOf4Jxu3Vrc1U4tuSQZJ9lq2j/aIXLcCwvR8VN6HVi
	u4UOPp+9ia0dCmK4qTZsyJH9iii6zw5NJwgS0AIvdiD6lSqQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmjgn3xwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sun, 26 Jul 2026 19:26:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee894b3d8so14723925ad.2
        for <linux-firmware@kernel.org>; Sun, 26 Jul 2026 12:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785094011; x=1785698811; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nKkSsVuRlDiZBKfVfBfg6NuXiXEhO4UkvdLce5eBchY=;
        b=FcKsCH362DXxs7sVY/GxLgC+hMlWUZVGdrBFTwo332o6BE9NDG5nfPcd8YVAGJOS5I
         wNyz2731t0k02CteQ3EOeQnw0KIhlUZfLVuxda68nljacLJQi5ovc5DVGI8IVH3zZ800
         b6uY+mYUeELFtHWQubDq+xahlNDkiQQX5vRR5q/S5JGvqlNdmhsc3+HiJsfPTQYXK2qE
         es8a1mPRX1E4xFt0KSYZzRoz/y2tjysYKK+n3D0FzgbhD2BH2o8tWmw1Wy3n/i/BpHTE
         Rjo5W6ABSqs9HfKpAgX82P5pXthPqLGv60//eNYk2BYx6jKtezBY2YuqkuYDWERacTEa
         9f6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785094011; x=1785698811;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nKkSsVuRlDiZBKfVfBfg6NuXiXEhO4UkvdLce5eBchY=;
        b=j9pJhnGjOVAsT58gGB5nDlveiE/yDXit5zK9t+JNsTOEOHnhZdpxWVlg+0trV0DFXF
         5imOhZj4rrg8vKKRvtfRAGq7vaPjUOKdrv0c4ndgxSsrM1PqRtkE5u+AFHPMBuHk8Wqr
         SrmsW2jTdnDt2SsvzEFe0zwrsSk0+I1786Dln4I3vwsHG7R8Nsvc4zyDI2JR1cs3dCkX
         JFRRiXq9sBujxBuUty8ipRJnndFXqVCn5SW9pf4azxbXlPLf/D4/+ow6RoXJxgYcnvNq
         2rcm0DSnOA9RFkkGT1jy8euchYi30itjT+Y0FryuGacuQjrphsGXENUqgWn4PHRVRj8n
         //IA==
X-Gm-Message-State: AOJu0YzCkhO0j1k6OJzeqp1IoTi5BSZdxkZzvJqvdTyvUy1NJ7KL/IOM
	Eedq4ptpsHTunUDgrWVpq6BPV0VUdcQHw3xqfk9gUKSVaJi9h+Aj0X3s2Ay40eMW9wwMsxpPZTD
	C3BgJJLGtGobxkBBgg7/hTDp2nPSPsA1BLPbhkSJjzUR0Jzro78ATLgjfjGgfohw2OIBeXiY=
X-Gm-Gg: AR+sD115G1OGFmSEHbYl/AXk+8L99AB3hLbAHBSz6KyAIcVc4WxMyIvfnsUwktdXjK5
	SJ2HQZ8+My06yPi7aAXOCvPBRJ7fVcsaB1CQodURKKWSh889iNYd/PX/6Rp3zm0O4Lq3W66sAWA
	wgaM/IfqKZizigvBkCf4y9Yh81GCU4Phu37J3rKHk8PDxYImtGEOplOwcAzdM6WP++tEYcFLPS1
	R7OhJyVV+nK7BFMBHgdMCQK6JgEZ/KQrkaidEQTgWmvN1cMOsSbVtwxvkNH0QmffgZYQWx02JEb
	SSdn/8qc6ccsAfg3/GIAvkbjateNNq/044wxDts4VRBX+hqZ5sGu4NYqBO5Y19ozunq8jH/uBNm
	5QhBdNa3VHzZ93EosdoPA01ysDw+jPR7NyLc=
X-Received: by 2002:a05:6a20:4b1b:b0:3c3:9835:e76b with SMTP id adf61e73a8af0-3c67df07a05mr4121668637.49.1785094011549;
        Sun, 26 Jul 2026 12:26:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:4b1b:b0:3c3:9835:e76b with SMTP id adf61e73a8af0-3c67df07a05mr4121653637.49.1785094011156;
        Sun, 26 Jul 2026 12:26:51 -0700 (PDT)
Received: from [192.168.0.3] ([49.205.250.235])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2263069a12.19.2026.07.26.12.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 12:26:50 -0700 (PDT)
Message-ID: <78adb7e2-9950-4999-a066-684d150b0d05@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 00:55:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: dbaryshk@qti.qualcomm.com, raghukan@qti.qualcomm.com,
        vkasinat@qti.qualcomm.com, rajup@qti.qualcomm.com,
        kbajaj@qti.qualcomm.com, vkraleti@qti.qualcomm.com,
        saddam.patan@oss.qualcomm.com
From: Srikanth Katakam <srikanth.katakam@oss.qualcomm.com>
Subject: qcom: Update qdsp6sw firmware for shikra platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RwP-FVEU2Rk3Zmmx86JL--ySX_baqBbZ
X-Authority-Analysis: v=2.4 cv=HMHz0Itv c=1 sm=1 tr=0 ts=6a665f7c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=0hwVoJlN8xuACXbUU1iW/A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=qC_FGOx9AAAA:8 a=XWUE-Mw4ByDnDDjHps0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE5NyBTYWx0ZWRfX7H81P7J+XUiC
 T5oVNyBGkGwxSTnAZppTK6GffcpR3F4oyNqwuUBTj3z+qrgNHcCAYkC9GMM/QMoKI2gGpyqy95S
 fxAF71Z8AEXJ9dGwu/V/F7dejsk01fn1pum3CUEi1w3ODAy+w+Dzr3C4mJgcKOyXUlzDgAE5yae
 nRl3EJBXnGxFhkX2fx/Pj4eoz7ylgFSF79wwVWORwMA7CLT11N4016w1nLBGv4yZW+XZ4V4OomF
 nyn66zPgzOVaaGsGM7HF0mfpDasgpG6K3rhjaQttam7v3WsFeoeh+Q6/InmdRbIo/eqqJmixBEG
 fsntUlM5gETz1A1HsG0nFewJOGNlnJt5vj1/CBaW0stg364ltCsSgupjoT8GeqQJvquWPw5adiT
 by8h5QoKIn8V2ucAcVEzYIy5jce8dPE9XGTUh+t0oeZpod8O9KXOtd8M2u0uhnOGoIfBjmse8H0
 h6rx6Nu07PHncpkuhBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE5NyBTYWx0ZWRfX5tos8qV4rhGx
 xVVoaLUymmUpdeysdI82noX3vqVAa78pPxhliF3g9+hG/b/O7RhzoFRZ5BDXjvva3R5knwRu97n
 sgp2diUsSOnBklqdm3oSxt4sNgr1zPU=
X-Proofpoint-ORIG-GUID: RwP-FVEU2Rk3Zmmx86JL--ySX_baqBbZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260197

The following changes since commit 924d73c9a2501a256d18a26cbe640548c70b3a9a:

   Merge branch 'robot/pr-0-1784191359' into 'main' (2026-07-16 10:39:46 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
modem-fw-shikra7

for you to fetch changes up to b4763ad2e9fee502446cd89b7a5b9a64bc7bb968:

   qcom: Update qdsp6sw firmware for shikra platform (2026-07-27 
00:37:30 +0530)

----------------------------------------------------------------
Srikanth Katakam (1):
       qcom: Update qdsp6sw firmware for shikra platform

  WHENCE                      |   2 +-
  qcom/shikra/cqs/qdsp6sw.mbn | Bin 5709176 -> 5709176 bytes
  2 files changed, 1 insertion(+), 1 deletion(-)
