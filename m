Return-Path: <superm1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801B4C282EC
	for <linux-firmware@archiver.kernel.org>; Mon, 17 Mar 2025 20:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4EA13C4CEED; Mon, 17 Mar 2025 20:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4691C4CEF0;
	Mon, 17 Mar 2025 20:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742243234;
	bh=uW68w0+PlhQdyoUiV3wUVf+oVCk7DphHwsf2NORTykw=;
	h=Date:Subject:List-Id:To:References:From:In-Reply-To:From;
	b=f6RGu6lTDmV6OP8dv88aJ8i8tw7QZ4kSFUiod/3l4YPsdiKp5avSrRGkq9MNSjCge
	 8vizntnilbvru0Fzv9tn3+nTxaTpDqcPvVse+wYRLMzEF3KR6BLFKckva1YbmatmL3
	 5KGMcrMTK7cTN/7ob1ssXsK2qwQcd7bP5MFyN8dRWcmT/cygsnb8nYRT1xQbdEpx5d
	 j7w+Iatc83ePy0dBljSNY3LEnEuJDzuZH+WDgauJ3Uc+q1QQbEAMQXq6E8UChccj+3
	 d3Z1dse2dT1sJjPh3XjwQDOls5e2LSf+HGpaSMxnzAfGew27PfeEmPqGc9mUOOXfaH
	 xo7pUEDMysk5g==
Message-ID: <3c09c8a1-21c3-49f6-9e41-e409fd38883a@kernel.org>
Date: Mon, 17 Mar 2025 15:27:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] copy-firmware: make script smarter about parameters
List-Id: <linux-firmware.lore.kernel.org>
To: Timur Tabi <ttabi@nvidia.com>, jwboyer@kernel.org,
 maxim.cournoyer@gmail.com, linux-firmware@kernel.org
References: <20250317191606.64181-1-ttabi@nvidia.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250317191606.64181-1-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/17/2025 14:16, Timur Tabi wrote:
> Several improvements to copy-firmware.sh that make it more friendly
> when passed unknown or not exactly correct command-line parameters.
> 
> 1) Add a usage() function to show the command-line options.
> 2) Print that usage on all errors.
> 3) Don't fail with a weird error if there's a space between -j and
>     the number.
> 4) Add support for the -h or --help options.
> 5) Ignore any command-line unsupported parameters that start with
>     a dash.  This is necessary because otherwise the script will
>     assume the option is actually a destination directory, and then
>     the "test" command will get confused.  Drawback is that we don't
>     support any more destination directories that start with a dash,
>     but no one does that.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>   copy-firmware.sh | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)

/Conceptually/ I'm aligned on everything in this patch.

A few things.

1) One patch per change please.
2) It appears that the second patch in this this series fails CI.  You 
should install pre-commit or run `make check` to check before submitting 
in the future.

Here are the details of the failure.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/486

BTW - In general it would be better to submit a MR so that you could 
just force push a fix.

> 
> diff --git a/copy-firmware.sh b/copy-firmware.sh
> index dd4b9b6f..cd5a6893 100755
> --- a/copy-firmware.sh
> +++ b/copy-firmware.sh
> @@ -11,8 +11,13 @@ compext=
>   destdir=
>   num_jobs=1
>   
> +usage() {
> +    echo "Usage: $0 [-v] [-jN] [--xz|--zstd] <destination directory>"
> +}
> +
>   err() {
>       printf "ERROR: %s\n" "$*"
> +    usage
>       exit 1
>   }
>   
> @@ -39,6 +44,7 @@ while test $# -gt 0; do
>   
>           -j*)
>               num_jobs=$(echo "$1" | sed 's/-j//')
> +            num_jobs=${num_jobs:-1}
>               if [ "$num_jobs" -gt 1 ] && ! has_gnu_parallel; then
>                       err "the GNU parallel command is required to use -j"
>               fi
> @@ -66,6 +72,18 @@ while test $# -gt 0; do
>               shift
>               ;;
>   
> +        -h|--help)
> +            usage
> +            exit 1
> +            ;;
> +
> +        -*)
> +            # Ignore anything else that begins with - because that confuses
> +            # the "test" command below
> +            warn "ignoring option $1"
> +            shift
> +            ;;
> +
>           *)
>               if test -n "$destdir"; then
>                   err "unknown command-line options: $*"

